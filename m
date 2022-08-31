Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ED7804
	for <loongarch@lists.linux.dev>; Wed, 31 Aug 2022 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1661944191;
	bh=8XbdqaONtZ7pmuAJ5DQX8N6I8PArVUZF81z1ZRwruLg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eFRdaJVMKl8xAVHztJPif52LbxIx1i2fOFYxYXqKWIUc83IH/cQAlxpsVhJvrBuP9
	 G4nvJxSj2uorsllgHVjC2mmEU7RSZVIqtMWGsm+RQYYoXXzJ2l4J5ZZp0l/3IJ/yAj
	 rvtQrHZXd4UjqWnf0g6hL/riObYm6p5JVSkytoOk=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id C6D8766841;
	Wed, 31 Aug 2022 07:09:49 -0400 (EDT)
Message-ID: <eb77b42f8ec4b67c1554dfac4a8efdfd8a4168c6.camel@xry111.site>
Subject: Re: [PATCH 1/1] LoongArch: Fixed loongarch kernel csr_xxx implicit
 declaration.
From: Xi Ruoyao <xry111@xry111.site>
To: =?gb2312?Q?=C0=EE=D3=EE=C5=F4?= <liyupeng@zbhlos.com>
Cc: chenhuacai <chenhuacai@kernel.org>, kernel <kernel@xen0n.name>, 
 "jiaxun.yang" <jiaxun.yang@flygoat.com>, loongarch
 <loongarch@lists.linux.dev>, linux-kernel <linux-kernel@vger.kernel.org>,
 caizp2008 <caizp2008@163.com>
Date: Wed, 31 Aug 2022 19:09:47 +0800
In-Reply-To: <AGcAvgDYFKf5CnvlznsCy4ok.3.1661932466929.Hmail.liyupeng@zbhlos.com>
References: <feb773a8df5d30b8d9347d1c922997c9da1fd06a.camel@xry111.site>
	 <AGcAvgDYFKf5CnvlznsCy4ok.3.1661932466929.Hmail.liyupeng@zbhlos.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.45.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2022-08-31 at 15:54 +0800, =E6=9D=8E=E5=AE=87=E9=B9=8F wrote:
>=20
> thank you for your reply=E3=80=82
> I used the latest gcc tool on the official website of loongson,gcc-
> 8.3.0.
> http://www.loongnix.cn/zh/toolchain/GNU/

Vanilla kernel cannot work with Loongnix:

1. In Loongnix, GRUB loads pass the essential information to the kernel
following "Loongson Firmware-Kernel Interface Specification".  Vanilla
kernel does not support it and will never support it.
2. In Loongnix, the syscall numbers are different and the layout of some
data structures used in kernel UAPI is different.  Any Loongnix
application invoking a syscall will likely blow up immediately on a
vanilla kernel.

These two problems are very difficult.  There is some plan to insert
compatibility layers to work around them, but not even one line of code
has been written AFAIK.

So if you want to build a kernel for Loongnix, don't use the vanilla
kernel.  If you just want to build a vanilla kernel with a pre-built
cross toolchain, use the toolchain from
https://kernel.org/pub/tools/crosstool/.
--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
