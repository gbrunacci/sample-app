'use client';
import { useSearchParams } from 'next/navigation';
import { HomeBody } from './HomeBody';

export default function Home() {
  const searchParams = useSearchParams();
  console.debug('I am rendering');
  return (
    <main>
      <h1>This is my title</h1>
      <HomeBody foo={searchParams.get('foo') || ''} />
    </main>
  );
}
