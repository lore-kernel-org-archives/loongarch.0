Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAB013AC4
	for <loongarch@lists.linux.dev>; Wed, 11 Oct 2023 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNbDCPPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E670C433B8
	for <loongarch@lists.linux.dev>; Wed, 11 Oct 2023 12:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697028803;
	bh=BAn9cTmPCgYcwvId5a7izdOqRdwYY/SugU+kfhYDqmU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vNbDCPPXyUzG1k1S5LP+RzKWDHkYnTzlCNRKS9n0DmyLAekfCMX9S+h0/5ItszNVx
	 lxL9DiQJuo4lIPl06/fFhQZqWnhjs1sXLv2zdPK4jrQ/FCTferJxFOajNqtOLXv0h7
	 94CDE3drhB1wBk5FBn4eIZNic/Nc/RSCd9AFwDbxIf8e+fzvkuoQzC2IqctC3DvMqD
	 zsMMo09k8IsqiU4uGy6Evi6BDckq9Ju34PyCyShlbFJzg9Y0zUcf5/IfC3zizCzj4s
	 IgEPZEulHAIddcH+BL0HNSw6JcRv2FJo01o6eKr4TK/oMi0NewiBdBGCo7eMY2odAI
	 q2+SHNQEyWK9Q==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1e5bc692721so2468767fac.0
        for <loongarch@lists.linux.dev>; Wed, 11 Oct 2023 05:53:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YxxXUPeK8OsfGMx8TNqtWugCNR/i7uEySrZyJOTlZG4XH1PqJf6
	m1IPvUbWy9fpiNuvPDlyRff+k6kJpGs9NsAKn6U=
X-Google-Smtp-Source: AGHT+IHunqCCf3/TPbLbNP9iC+WACbBVYbi8Ckvhhj1/4uAEKkWSBuHMfzGgLhnmZ11rboJKnGC/Z4MWi+rIZcz3AOo=
X-Received: by 2002:a05:6870:5611:b0:1d1:3a58:14a5 with SMTP id
 m17-20020a056870561100b001d13a5814a5mr26035580oao.25.1697028802212; Wed, 11
 Oct 2023 05:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231009124210.1064021-1-masahiroy@kernel.org>
 <20231009124210.1064021-4-masahiroy@kernel.org> <CAJF2gTTDpGgzsiRk=q6FCdX_g5maY-sT9h0jiW=p6HLziq97yA@mail.gmail.com>
In-Reply-To: <CAJF2gTTDpGgzsiRk=q6FCdX_g5maY-sT9h0jiW=p6HLziq97yA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 11 Oct 2023 21:52:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNATmaSXQYFMZEw2vpn6td10+huck-vy-Rbo5Brys+j_Stg@mail.gmail.com>
Message-ID: <CAK7LNATmaSXQYFMZEw2vpn6td10+huck-vy-Rbo5Brys+j_Stg@mail.gmail.com>
Subject: Re: [PATCH 4/5] kbuild: unify vdso_install rules
To: Guo Ren <guoren@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	"H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Russell King <linux@armlinux.org.uk>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 11:24=E2=80=AFAM Guo Ren <guoren@kernel.org> wrote:
>
> On Mon, Oct 9, 2023 at 8:42=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:

> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -131,12 +131,6 @@ endif
> >  libs-y +=3D arch/riscv/lib/
> >  libs-$(CONFIG_EFI_STUB) +=3D $(objtree)/drivers/firmware/efi/libstub/l=
ib.a
> >
> > -PHONY +=3D vdso_install
> > -vdso_install:
> > -       $(Q)$(MAKE) $(build)=3Darch/riscv/kernel/vdso $@
> > -       $(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
> > -               $(build)=3Darch/riscv/kernel/compat_vdso compat_$@)
> > -
> >  ifeq ($(KBUILD_EXTMOD),)
> >  ifeq ($(CONFIG_MMU),y)
> >  prepare: vdso_prepare
> > @@ -148,6 +142,9 @@ vdso_prepare: prepare0
> >  endif
> >  endif
> >
> > +vdso-install-y                 +=3D arch/riscv/kernel/vdso/vdso.so.dbg
> > +vdso-install-$(CONFIG_COMPAT)  +=3D arch/riscv/kernel/compat_vdso/comp=
at_vdso.so.dbg:../compat_vdso/compat_vdso.so
> Why do we need ":../compat_vdso/compat_vdso.so" here?




All architectures except riscv install vdso files
to /lib/modules/$(uname -r)/vdso/.



See the following code in arch/riscv/kernel/compat_vdso/Makefile:


quiet_cmd_compat_vdso_install =3D INSTALL $@
      cmd_compat_vdso_install =3D cp $(obj)/$@.dbg $(MODLIB)/compat_vdso/$@




Riscv copies the compat vdso to
/lib/modules/$(uname -r)/compat_vdso/.



This commit preserves the current installation path as-is.

If the riscv maintainers agree, we can change the
installation destination to /lib/modules/$(uname -r)/vdso/
for consistency.



--=20
Best Regards
Masahiro Yamada
