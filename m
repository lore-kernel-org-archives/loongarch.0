Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9772B7460
	for <loongarch@lists.linux.dev>; Thu, 25 Jan 2024 03:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706154396; cv=none; b=rECjqJeHdavW3UHau83N5nwlZR8qLWDXxJYvwTfo4ZsNT9HCmzFJZgX96rBMgJh+rQBhTDvh1Mz+U7HYYIG1lsJaOpTqfUYvQft2DclJUG6o1sB3fjkq8/bFl/UQyt//fxFeevEysKdTkzhb5Y0ViHmakHyKbmTPQUZg0c/TOQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706154396; c=relaxed/simple;
	bh=6gfTMOxiLZKJg3StuFFOtAoyY3gEZtO6MaF5DJ40Glw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vB9oUeufBjqtdwGNB3dz/K0r0ptGSBf+yYK4/uW1omzjVAuKclCVvyOppOC+kwapBLrgTs1DSSgqq2qpv3qmLba0xg7KZpEAIPc8jAQ9UkMOzjyQMLnjjQyS2xt49TSsNU3ZTwYl5m3M8ULJev76oEW/igsLMe5kTE8gZbJz3Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.210.49])
	by gateway (Coremail) with SMTP id _____8BxVfGU2bFlZE4FAA--.20773S3;
	Thu, 25 Jan 2024 11:46:29 +0800 (CST)
Received: from mail-ot1-f49.google.com (unknown [209.85.210.49])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxbs2Q2bFlD2gYAA--.38918S3;
	Thu, 25 Jan 2024 11:46:27 +0800 (CST)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6dddcf525f0so170427a34.0
        for <loongarch@lists.linux.dev>; Wed, 24 Jan 2024 19:46:27 -0800 (PST)
X-Gm-Message-State: AOJu0Yxg0SRJ07NsvIFx/6lKyTjLHYuC9YWVraKmwsW4tsIWpR5xya7p
	T1uxBE34lsRFFWjqbTPpnF9xa8IDOSL6pb0KSzhPN0CJcpWOrSDxoDimip+nk/f2Est2PLc1jgi
	hqLIojugNSVPLjwPWg2GbWAhz7uoqiAK5Cm6qvQ==
X-Google-Smtp-Source: AGHT+IHpJvy+uoPwJQ7ep0HeUIHFzj8XP2fjNevYr3ODRNUs//WbEIINo71dKyNK1G8dpRw276rewQWOfKy6TPkVG2A=
X-Received: by 2002:a25:aac2:0:b0:dc2:1faf:e7c6 with SMTP id
 t60-20020a25aac2000000b00dc21fafe7c6mr442935ybi.59.1706152803997; Wed, 24 Jan
 2024 19:20:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-2-Jamie.Cunliffe@arm.com> <CALNs47vzQm5MbfJtMQR3p+W1xub3KHiNqRgEQGWT3u28fpQ-oA@mail.gmail.com>
In-Reply-To: <CALNs47vzQm5MbfJtMQR3p+W1xub3KHiNqRgEQGWT3u28fpQ-oA@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Thu, 25 Jan 2024 11:19:53 +0800
X-Gmail-Original-Message-ID: <CAHirt9jhbnXz34D-pmHNecMfkefL4wTr9LYj_V28OsVd=fkdZA@mail.gmail.com>
Message-ID: <CAHirt9jhbnXz34D-pmHNecMfkefL4wTr9LYj_V28OsVd=fkdZA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
To: Trevor Gross <tmgross@umich.edu>
Cc: Jamie Cunliffe <Jamie.Cunliffe@arm.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, steve.capper@arm.com, 
	Asahi Lina <lina@asahilina.net>, boqun.feng@gmail.com, andrew@lunn.ch, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8Cxbs2Q2bFlD2gYAA--.38918S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZFyDJw1xXr4kCrW7AFy5Awc_yoWrtw4Dpa
	n5CF4fAFW8J3yYga1xtFW3ur45Kws5Wr109F4xGw1jyr15WFn2grWIkr43uF1UCay7C3yr
	XF1I9F97ur4UAwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUd529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Mq2tUUUUU==

Hello,

On Mon, Jan 22, 2024 at 5:17=E2=80=AFPM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> On Fri, Oct 20, 2023 at 10:59=E2=80=AFAM Jamie Cunliffe <Jamie.Cunliffe@a=
rm.com> wrote:
> >
> > Eventually we want all architectures to be using the target as defined
> > by rustc. However currently some architectures can't do that and are
> > using the target.json specification. This puts in place the foundation
> > to allow the use of the builtin target definition or a target.json
> > specification.
> >
> > Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> > ---
> >  Makefile          | 1 -
> >  arch/x86/Makefile | 1 +
> >  rust/Makefile     | 5 ++++-
> >  scripts/Makefile  | 4 +++-
> >  4 files changed, 8 insertions(+), 3 deletions(-)
>
> Adding LoongArch maintainers - this patch will need a small update to
> arch/loongarch/Makefile similar to the change in arch/x86/Makefile
> (included below), since that support is now in-tree and uses
> generate_rust_target [1]. Also a very minor conflict in docs at patch
> 2/2.
>
> I believe this patchset is still waiting on an ack from the kbuild
> team. Series at [2] for reference.
>
> Thanks,
> Trevor
>
> [1]: https://lore.kernel.org/rust-for-linux/20240108032117.215171-1-wangr=
ui@loongson.cn/
> [2]: https://lore.kernel.org/rust-for-linux/20231020155056.3495121-1-Jami=
e.Cunliffe@arm.com/

I can confirm that the fix patch [2], based on patch [1], is suitable
for LoongArch. LoongArch encounters no issues when using the built-in
`loongarch64-unknown-none-softfloat` target. Once patch [1] is merged
into the mainline, I'll send a patch to switch to using the built-in
target.

Thanks,
Rui

[1]: https://lore.kernel.org/rust-for-linux/20231020155056.3495121-1-Jamie.=
Cunliffe@arm.com/
[2]: https://github.com/heiher/linux/commit/c504d83a6edd963e2ba58ec538e3f06=
da78b187e.patch

>
> > diff --git a/Makefile b/Makefile
> > index 88ebf6547964..23100f193da3 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -566,7 +566,6 @@ KBUILD_CFLAGS +=3D -fno-strict-aliasing
> >
> >  KBUILD_CPPFLAGS :=3D -D__KERNEL__
> >  KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
> > -                   --target=3D$(objtree)/scripts/target.json \
> >                     -Cpanic=3Dabort -Cembed-bitcode=3Dn -Clto=3Dn \
> >                     -Cforce-unwind-tables=3Dn -Ccodegen-units=3D1 \
> >                     -Csymbol-mangling-version=3Dv0 \
> > diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > index 5bfe5caaa444..0f339d4abd40 100644
> > --- a/arch/x86/Makefile
> > +++ b/arch/x86/Makefile
> > @@ -68,6 +68,7 @@ export BITS
> >  #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D53383
> >  #
> >  KBUILD_CFLAGS +=3D -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> > +KBUILD_RUSTFLAGS +=3D --target=3D$(objtree)/scripts/target.json
> >  KBUILD_RUSTFLAGS +=3D -Ctarget-feature=3D-sse,-sse2,-sse3,-ssse3,-sse4=
.1,-sse4.2,-avx,-avx2
> >
> >  ifeq ($(CONFIG_X86_KERNEL_IBT),y)
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 87958e864be0..8d75a6ffe951 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -428,8 +428,11 @@ $(obj)/core.o: private skip_clippy =3D 1
> >  $(obj)/core.o: private skip_flags =3D -Dunreachable_pub
> >  $(obj)/core.o: private rustc_objcopy =3D $(foreach sym,$(redirect-intr=
insics),--redefine-sym $(sym)=3D__rust$(sym))
> >  $(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
> > -$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs scripts/target.json FOR=
CE
> > +$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
> >         $(call if_changed_dep,rustc_library)
> > +ifdef CONFIG_X86_64
> > +$(obj)/core.o: scripts/target.json
> > +endif
> >
> >  $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'
> >  $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o =
FORCE
> > diff --git a/scripts/Makefile b/scripts/Makefile
> > index 576cf64be667..c85d130a4125 100644
> > --- a/scripts/Makefile
> > +++ b/scripts/Makefile
> > @@ -11,12 +11,14 @@ hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)       =
         +=3D sign-file
> >  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)    +=3D insert-sys=
-cert
> >  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=3D ru=
stdoc_test_builder
> >  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=3D ru=
stdoc_test_gen
> > -always-$(CONFIG_RUST)                                  +=3D target.jso=
n
> >
> > +ifdef CONFIG_X86_64
> > +always-$(CONFIG_RUST)                                  +=3D target.jso=
n
> >  filechk_rust_target =3D $< < include/config/auto.conf
> >
> >  $(obj)/target.json: scripts/generate_rust_target include/config/auto.c=
onf FORCE
> >         $(call filechk,rust_target)
> > +endif
> >
> >  hostprogs +=3D generate_rust_target
> >  generate_rust_target-rust :=3D y
> > --
> > 2.30.2
> >
> >
>

