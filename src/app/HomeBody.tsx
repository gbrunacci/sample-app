'use client';
import React from 'react';
import { usePathname, useRouter, useSearchParams } from 'next/navigation';

export function HomeBody({ foo }: { foo: string }) {
  const id = React.useId();
  console.debug('id is', id);

  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();

  const createQueryString = React.useCallback(
    (name: string, value: string) => {
      const params = new URLSearchParams(searchParams);
      params.set(name, value);

      return params.toString();
    },
    [searchParams],
  );

  return (
    <div>
      <button
        onClick={() => {
          router.push(
            pathname +
              '?' +
              createQueryString('foo', new Date().getTime().toString()),
          );
        }}
      >
        Foo value is {foo}
      </button>
    </div>
  );
}
