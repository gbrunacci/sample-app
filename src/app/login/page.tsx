'use client';
import { useSession, signIn, signOut, SessionProvider } from 'next-auth/react';

function Button() {
  const { data: session } = useSession();
  if (session) {
    return (
      <>
        Signed in as {session.user?.email} <br />
        <button onClick={() => signOut()}>Sign out</button>
      </>
    );
  }
  return (
    <>
      Not signed in <br />
      <button onClick={() => signIn('email', {
        email: 'testapp@yopmail.com'
      })}>Sign in</button>
    </>
  );
}

export default function Page() {
  return (
    <SessionProvider>
      <Button />
    </SessionProvider>
  );
}
