Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5569173
	for <loongarch@lists.linux.dev>; Tue,  6 Sep 2022 00:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1662424337;
	bh=tnkg6NDxCuY/leErq28zhAiAg1e8lpHeUNO0dIKqK9k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Icsh2aKiMJaRvYwsBLvliJiM6JvC0BpVyKB7ha/7oyBcYjXPnao5sqrOpv6gQL2/T
	 HK0VesT/Fb+Zur1m4JUpyHqIiCJy4Z7sckeiewcdVRxN5QwpM0S9Uzdjfq2vx1EgKt
	 ZRYC3e0OEvDzc3pdqGKHKL+QaYr9C6Hoj30wPJhI=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id B70B265A9D;
	Mon,  5 Sep 2022 20:32:15 -0400 (EDT)
Message-ID: <ae2652c5e140d407d523d7f35bee672cebe1b7a2.camel@xry111.site>
Subject: Re: [PATCH v7 0/5] LoongArch: Support toolchain with new relocation
 types
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jinyang He <hejinyang@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, Youling
 Tang <tangyouling@loongson.cn>
Date: Tue, 06 Sep 2022 08:32:13 +0800
In-Reply-To: <CAAhV-H6wzw-MV+h225rM4PfK_HY0tAdSXcUG-2Hx+_gfhzQ4_g@mail.gmail.com>
References: <20220830104806.128365-1-xry111@xry111.site>
	 <CAAhV-H5bH7xZTWLhqcZ_Bmh=RNaEVBy9523hmj-gTmitqqc8ag@mail.gmail.com>
	 <c0ba2e23-5be3-924d-554a-2f10272c05bc@xen0n.name>
	 <CAAhV-H7Dz21qRgwkMcJ0SnA9FNDN19E6mpa7C25LUitrO9LGeA@mail.gmail.com>
	 <5b87173faeef587a2ffaaa6f58d34e0940231067.camel@xry111.site>
	 <c53303bf-a5d2-098f-8975-efadbe0b2f2e@loongson.cn>
	 <bc323d8578d2f6ec580066bab181788b305ae3c3.camel@xry111.site>
	 <CAAhV-H4N_XvmP9KA1M5crU44kHr33MZUVSsMY4Ugu5wQSv_LOQ@mail.gmail.com>
	 <97291c0fe5a660c844475ff019c8db6af77ecf86.camel@xry111.site>
	 <CAAhV-H6wzw-MV+h225rM4PfK_HY0tAdSXcUG-2Hx+_gfhzQ4_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.45.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2022-09-01 at 10:17 +0800, Huacai Chen wrote:

> Now all global variable accesses are via got, I think the performance
> may be much worse than before when we didn't use explicit-relocs.
> I don't know whether "a new code model" or your "(1)(2)(3)" is easier
> to implement, but I think it is better to solve the performance issue
> before 6.1-rc1.

Hi Huacai,

We've added a GCC option for this at https://gcc.gnu.org/r13-2433.  On
the kernel side we need a one-line change:

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 92c4a52c4c3e..69b39ba3a09d 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -54,6 +54,7 @@ LDFLAGS_vmlinux                       +=3D -G0 -static -n=
 -nostdlib
 # upgrade the compiler or downgrade the assembler.
 ifdef CONFIG_AS_HAS_EXPLICIT_RELOCS
 cflags-y                       +=3D -mexplicit-relocs
+KBUILD_CFLAGS_KERNEL           +=3D -mdirect-extern-access
 else
 cflags-y                       +=3D $(call cc-option,-mno-explicit-relocs)
 KBUILD_AFLAGS_KERNEL           +=3D -Wa,-mla-global-with-pcrel

And we also need a one-line change in the EFI stub patch (under review):

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/l=
ibstub/Makefile
index 8931ed24379e..8c1225b92492 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -27,7 +27,7 @@ cflags-$(CONFIG_ARM)          :=3D $(subst $(CC_FLAGS_FTR=
ACE),,$(KBUILD_CFLAGS)) \
 cflags-$(CONFIG_RISCV)         :=3D $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_C=
FLAGS)) \
                                   -fpic
 cflags-$(CONFIG_LOONGARCH)     :=3D $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_C=
FLAGS)) \
-                                  -fpic
+                                  -fpie
=20
 cflags-$(CONFIG_EFI_GENERIC_STUB) +=3D -I$(srctree)/scripts/dtc/libfdt

(Some explanation: -fpic does not only mean "generate position-
independent code", but "generate position-independent code *suitable for
use in a shared library*".  On LoongArch -mdirect-extern-access cannot
work for a shared library so the "-fpic -mdirect-extern-access"
combination is rejected deliberately.)

Not sure how to submit these changes properly...  Do you prefer me to
send V8 of this series or a single patch on top of your tree on GitHub?

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
