Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC2429A5
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1676465507;
	bh=MUWUkL8rO981gmCLrVOjPwLtUdMwE5KMREDb1Q0ZIhE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SIBsXnczOMXEUFhFmrpm9Xs6N1S62dfK/3vfnOEK4KN/5UacNTPtt8b6UjzCVf++b
	 JF+7EejyL2Tc1TZUwJAXtXn4Wcr0SSF47qRxpOknQmjOa7o63kdbooiEcVcpjwXbyB
	 4Za5nDMv5X+3OQe0gtIt+30bKwEW02QxvYDPL+yE=
Received: from [IPv6:240e:358:111b:f00:dc73:854d:832e:3] (unknown [IPv6:240e:358:111b:f00:dc73:854d:832e:3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id EE16166220;
	Wed, 15 Feb 2023 07:51:43 -0500 (EST)
Message-ID: <6268f221cfca8b7550ad0673246f09cd439ede05.camel@xry111.site>
Subject: Re: "kernel ade access" oops on LoongArch
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <tangyouling@loongson.cn>
Cc: Jinyang He <hejinyang@loongson.cn>, loongarch@lists.linux.dev, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 linux-kernel@vger.kernel.org
Date: Wed, 15 Feb 2023 20:51:38 +0800
In-Reply-To: <bf0e57db317d7061ecaaf928ce6cf40941b1740c.camel@xry111.site>
References: <1e6f4d35946e4e2e7c7f5dcc7b69d5e609de8184.camel@xry111.site>
	 <2e902dfa-cb84-7ef0-6b50-02b16354a139@loongson.cn>
	 <511d385675ea7a846ff791974c6ae7feeeec2589.camel@xry111.site>
	 <9a70e89c-0f3b-0660-501e-3292e410cfd8@loongson.cn>
	 <5403e5eb-5792-7d6f-df74-ca3fab82ecd5@loongson.cn>
	 <818419c03037bda833a5b281588a4b331c34ae8c.camel@xry111.site>
	 <74fb1e24-36c0-c642-5bab-3646ba7790df@loongson.cn>
	 <21b0e60dac8bedf9e389645ec103aa4241b35f8d.camel@xry111.site>
	 <bf0e57db317d7061ecaaf928ce6cf40941b1740c.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-02-15 at 19:52 +0800, Xi Ruoyao wrote:
> On Wed, 2023-02-15 at 16:35 +0800, Xi Ruoyao wrote:
> > On Wed, 2023-02-15 at 16:25 +0800, Youling Tang wrote:
> > > Can you modify the kernel as follows and test it, so as to avoid
> > > possible relationship with the exception table data link position
> > > and
> > > alignment rules (or use EXCEPTION_TABLE(12))?
> > >=20
> > > --- a/arch/loongarch/kernel/vmlinux.lds.S
> > > +++ b/arch/loongarch/kernel/vmlinux.lds.S
> > > @@ -4,7 +4,6 @@
> > > =C2=A0 #include <asm/thread_info.h>
> > >=20
> > > =C2=A0 #define PAGE_SIZE _PAGE_SIZE
> > > -#define RO_EXCEPTION_TABLE_ALIGN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 4
> > >=20
> > > =C2=A0 /*
> > > =C2=A0=C2=A0 * Put .bss..swapper_pg_dir as the first thing in .bss. T=
his
> > > will
> > > @@ -54,6 +53,8 @@ SECTIONS
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(PECOFF_S=
EGMENT_ALIGN);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _etext =3D .;
> > >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXCEPTION_TABLE(16)
> > > +
> >=20
> > It seems the kernel refuses to boot after the change, but I'm not
> > completely sure: I'm 5 km away from the board and operating it via
> > ssh
> > so maybe it's a reboot failure or network failure.=C2=A0 I'll report
> > again in
> > the evening.
>=20
> It was a reboot failure.
>=20
> Now it has booted successfully, but the stack trace still shows (during
> the 25th run of the make test t=3D... command).

Ouch, I know what's happening...

In the architecture-independent code we have something like

extern struct exception_table_entry a[], b[];
bsearch(a, b - a);

According to the C standard, when you write "b - a" where a and b are
pointers to type T, "b" and "a" must be pointers to elements in the same
array of T.  So the compiler can assume ((uintptr_t)b - (uintptr_t)a) %
12 =3D=3D 0 and optimize "b - a" to something like

(((uintptr_t)b - (uintptr_t)a) >> 2) * inv3

Here inv3 is the inversion of 3 in the modulo-2**64 integer ring, so the
compiler can avoid an expensive divide instruction.  But in my vmlinux
((uintptr_t)b - (uintptr_t)a) is somehow not a multiple of 12:

(gdb) p ((uintptr_t)__stop___ex_table - (uintptr_t)__start___ex_table) % si=
zeof(struct exception_table_entry)
$9 =3D 8

So I guess

#define RO_EXCEPTION_TABLE_ALIGN       12

will work.  I'll take a try...

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
