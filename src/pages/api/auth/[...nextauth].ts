import NextAuth from 'next-auth';
import { Adapter } from 'next-auth/adapters';
import EmailProvider from 'next-auth/providers/email';

function MyAdapter(): Adapter {
  return {
    createUser: (data) => {
      throw new Error('Not implemented');
    },
    getUser: (id) => {
      throw new Error('Not implemented');
    },
    getUserByEmail: (email) => {
      return {
        id: '1',
        email,
        emailVerified: new Date(),
      };
    },
    async getUserByAccount(provider_providerAccountId) {
      throw new Error('Not implemented');
    },
    updateUser: ({ id, ...data }) => {
      throw new Error('Not implemented');
    },
    deleteUser: (id) => {
      throw new Error('Not implemented');
    },
    linkAccount: (data) => {
      throw new Error('Not implemented');
    },
    unlinkAccount: (provider_providerAccountId) => {
      throw new Error('Not implemented');
    },
    async getSessionAndUser(sessionToken) {
      throw new Error('Not implemented');
    },
    createSession: (data) => {
      throw new Error('Not implemented');
    },
    updateSession: (data) => {
      throw new Error('Not implemented');
    },
    deleteSession: (sessionToken) => {
      throw new Error('Not implemented');
    },
    async createVerificationToken(data) {
      console.log('createVerificationToken', data);
      return {
        identifier: 'asdqwe123',
        expires: new Date('2025-01-05'),
        token: 'asdqwe123',
      };
    },
    async useVerificationToken(identifier_token) {
      console.log('useVerificationToken', identifier_token);
      return {
        identifier: 'asdqwe123',
        expires: new Date('2025-01-05'),
        token: 'asdqwe123',
      };
    },
  };
}

export default NextAuth({
  adapter: MyAdapter(),
  providers: [
    EmailProvider({
      server: {
        host: 'smtp.ethereal.email',
        port: 587,
        secure: false, // true for 465, false for other ports
        auth: {
          user: 'czlqdndndeudtzv2@ethereal.email', // generated ethereal user
          pass: '2E3XCDhZ8mRG5JCNVs', // generated ethereal password
        },
      },
      from: 'czlqdndndeudtzv2@ethereal.email',
      sendVerificationRequest(all) {
        console.log({ all });
      },

      // maxAge: 24 * 60 * 60, // How long email links are valid for (default 24h)
    }),
  ],
  session: {
    strategy: 'jwt',
  }
});
