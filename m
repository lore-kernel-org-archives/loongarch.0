Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8D51365
	for <loongarch@lists.linux.dev>; Sat,  2 Jul 2022 00:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1656722911;
	bh=ItOYQ5u75sNWyNQkJV+RjAg0hWQoFTmk2h97EywXXWc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Qf6dozqvDx2zB3zazFvyez3DGsqJL4hvpl1QOZPXu0ENpvpoR1rTSW/0UeTfT4/ON
	 eg9CS3ZVZSSuuusGtXBT+gbhvDF7u6CyD82nEimVMgLUgmxn7oU87EOr6sm/MqSuSK
	 1yOc9Xh8BFjHwGTrbKutdb0fzsvH/+bAO1LfSnO0=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 2FFBB65931;
	Fri,  1 Jul 2022 20:48:29 -0400 (EDT)
Message-ID: <3eba6c41c9ddad11f963e12cf44c12fbf9ccbda2.camel@xry111.site>
Subject: Re: Building loongarch64 toolchain
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Guenter Roeck <linux@roeck-us.net>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev
Date: Sat, 02 Jul 2022 08:48:28 +0800
In-Reply-To: <dba07911-817c-f9fd-38a4-81f4b8166012@xen0n.name>
References: <f83d6a9d-ec07-21d1-87e3-700475192694@roeck-us.net>
	 <CAAhV-H41pxiYudNRYOYK8hndMA2Ki6VUXxSaqa27yME1mjWjgw@mail.gmail.com>
	 <9427ebf1-8b5a-cebc-6ec4-2414197c24a8@roeck-us.net>
	 <4f874205-d004-fa00-6fe0-b959ba21c186@xen0n.name>
	 <20220701183437.GA2976148@roeck-us.net>
	 <dba07911-817c-f9fd-38a4-81f4b8166012@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2022-07-02 at 02:51 +0800, WANG Xuerui wrote:
> On 7/2/22 02:34, Guenter Roeck wrote:

> I think it's due to commit 748594bc07f3 ("LoongArch: Use functions=20
> instead of magic numbers.") being the prerequisite.=C2=A0 I personally us=
e=20
> either the Gentoo toolchain (for normal/casual use) or the trunk version=
=20
> (for development) anyway...
> >=20
> > > BTW, you could use the Gentoo toolchain for easy experimentation if t=
hat's
> > > acceptable for you. (I maintain the Gentoo/LoongArch port so I know t=
hat
> > > toolchain is working for most commonly encountered software. It's pro=
bably
> > > carrying more downstream patches than some of you would prefer, altho=
ugh I
> > > don't find that to be a problem so far.)

In my build I apply every non-GDB LoongArch changes in binutils-gdb.git
master branch for 2.38.  Some of them are needed to keep the binutils
test result clean (and I don't want to spend too much time finding out
"which is really necessary").

> >=20
> > At this point I am just trying to compile the Linux kernel. The next st=
ep
> > would be create a root file system and to boot that kernel in qemu.
> > I'll leave that for later when I find an example of how to do that
> > to make sure that I don't waste my time playing around with qemu.
> > Until then, I think I'll just stick with my hack (and hopefully the
> > next version of binutils should work).

BTW recently we also fixed a severe GCC issue for LoongArch:

https://gcc.gnu.org/r12-8520

I'm not sure if this issue will cause miscompilation of the kernel or
"some parts" of the kernel.
> >=20

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
