Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611E179D1
	for <loongarch@lists.linux.dev>; Tue, 21 Nov 2023 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rym6yS6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069C2C433CC
	for <loongarch@lists.linux.dev>; Tue, 21 Nov 2023 11:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700567733;
	bh=NbNT5zN14ASPakIUDj5Dgbng3gBVPQPgEtJ+oGscF5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Rym6yS6I+UjdTyS9eiu/es8/cT3FGCS9H1ybruTpI9QxIJSRo4oHhOzYDRLNzCvRj
	 51lFp4qq9YZalaUsTtA6TQkChUp4S8+DZrSHB0cdP2NeJb7xtWrBT9s6/kEBXf6+rO
	 /m/w/wDBJTMjHHQC+/3oyDoNNYH8cgEtSEXzpB2+XO5CSCBN2RyxyM4YJu+I0WIJRr
	 4djjaXiXj42VKlFIxXKNCASWTXrKdqOsj3KSi7i2eiMzKR/BX/aJtyoTJcCQFCppe0
	 rC2dIM19J8QKfbY67yfatQAdiW2qfDdzBLBIgpq48yps6j/7cFXbtukmKY8KpU8D47
	 INIY/YU6pWvpQ==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5440f25dcc7so7745974a12.0
        for <loongarch@lists.linux.dev>; Tue, 21 Nov 2023 03:55:32 -0800 (PST)
X-Gm-Message-State: AOJu0YyxSd2/neQ139QE57d8+o6/2ARPh96WbVazByV15Bw7pt12RK2E
	OpbH20DhEi+GQ4hpIgbiESDwnkGkISqq1j4Mauo=
X-Google-Smtp-Source: AGHT+IE91ql6C6HLLlnfSwRVW7vXEWwt0jCtwSJuhc9ksIUkYLG23MxpSviJDMBoSB+9rPqP23kS3E07L/ZyWZoCrAI=
X-Received: by 2002:aa7:da0d:0:b0:548:d29d:a4ca with SMTP id
 r13-20020aa7da0d000000b00548d29da4camr1495144eds.42.1700567731470; Tue, 21
 Nov 2023 03:55:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231115091921.85516-1-zhaotianrui@loongson.cn>
 <20231115091921.85516-3-zhaotianrui@loongson.cn> <f003f38d-37fd-43ed-ada6-fb2d5b282e91@xen0n.name>
 <6d9395b5-e8f1-3990-adb0-a52d03411fc6@loongson.cn>
In-Reply-To: <6d9395b5-e8f1-3990-adb0-a52d03411fc6@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 21 Nov 2023 19:55:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Kq1gDvmAS9fnG4Lc4ot0H4tZftZvzSdd39fNjozo4bQ@mail.gmail.com>
Message-ID: <CAAhV-H6Kq1gDvmAS9fnG4Lc4ot0H4tZftZvzSdd39fNjozo4bQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: KVM: Add lasx support
To: zhaotianrui <zhaotianrui@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	loongarch@lists.linux.dev, Jens Axboe <axboe@kernel.dk>, 
	Mark Brown <broonie@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 5:59=E2=80=AFPM zhaotianrui <zhaotianrui@loongson.c=
n> wrote:
>
>
> =E5=9C=A8 2023/11/16 =E4=B8=8B=E5=8D=883:19, WANG Xuerui =E5=86=99=E9=81=
=93:
> > On 11/15/23 17:19, Tianrui Zhao wrote:
> >> This patch adds LASX support for LoongArch KVM. The LASX means
> >> LoongArch 256-bits vector instruction.
> >> There will be LASX exception in KVM when guest use the LASX
> >> instruction. KVM will enable LASX and restore the vector
> >> registers for guest then return to guest to continue running.
> >>
> >> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> >> ---
> >>   arch/loongarch/include/asm/kvm_host.h |  6 ++++
> >>   arch/loongarch/include/asm/kvm_vcpu.h | 10 +++++++
> >>   arch/loongarch/kernel/fpu.S           |  1 +
> >>   arch/loongarch/kvm/exit.c             | 18 +++++++++++
> >>   arch/loongarch/kvm/switch.S           | 16 ++++++++++
> >>   arch/loongarch/kvm/trace.h            |  4 ++-
> >>   arch/loongarch/kvm/vcpu.c             | 43 +++++++++++++++++++++++++=
+-
> >>   7 files changed, 96 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/loongarch/include/asm/kvm_host.h
> >> b/arch/loongarch/include/asm/kvm_host.h
> >> index 6c65c25169..4c05b5eca0 100644
> >> --- a/arch/loongarch/include/asm/kvm_host.h
> >> +++ b/arch/loongarch/include/asm/kvm_host.h
> >> @@ -95,6 +95,7 @@ enum emulation_result {
> >>   #define KVM_LARCH_SWCSR_LATEST    (0x1 << 1)
> >>   #define KVM_LARCH_HWCSR_USABLE    (0x1 << 2)
> >>   #define KVM_LARCH_LSX        (0x1 << 3)
> >> +#define KVM_LARCH_LASX        (0x1 << 4)
> >>     struct kvm_vcpu_arch {
> >>       /*
> >> @@ -181,6 +182,11 @@ static inline bool kvm_guest_has_lsx(struct
> >> kvm_vcpu_arch *arch)
> >>       return arch->cpucfg[2] & CPUCFG2_LSX;
> >>   }
> >>   +static inline bool kvm_guest_has_lasx(struct kvm_vcpu_arch *arch)
> >> +{
> >> +    return arch->cpucfg[2] & CPUCFG2_LASX;
> >> +}
> >> +
> >>   /* Debug: dump vcpu state */
> >>   int kvm_arch_vcpu_dump_regs(struct kvm_vcpu *vcpu);
> >>   diff --git a/arch/loongarch/include/asm/kvm_vcpu.h
> >> b/arch/loongarch/include/asm/kvm_vcpu.h
> >> index c629771e12..4f87f16018 100644
> >> --- a/arch/loongarch/include/asm/kvm_vcpu.h
> >> +++ b/arch/loongarch/include/asm/kvm_vcpu.h
> >> @@ -67,6 +67,16 @@ static inline void kvm_restore_lsx(struct
> >> loongarch_fpu *fpu) { }
> >>   static inline void kvm_restore_lsx_upper(struct loongarch_fpu *fpu)
> >> { }
> >>   #endif
> >>   +#ifdef CONFIG_CPU_HAS_LASX
> >> +void kvm_own_lasx(struct kvm_vcpu *vcpu);
> >> +void kvm_save_lasx(struct loongarch_fpu *fpu);
> >> +void kvm_restore_lasx(struct loongarch_fpu *fpu);
> >> +#else
> >> +static inline void kvm_own_lasx(struct kvm_vcpu *vcpu) { }
> >> +static inline void kvm_save_lasx(struct loongarch_fpu *fpu) { }
> >> +static inline void kvm_restore_lasx(struct loongarch_fpu *fpu) { }
> >> +#endif
> >> +
> >>   void kvm_acquire_timer(struct kvm_vcpu *vcpu);
> >>   void kvm_init_timer(struct kvm_vcpu *vcpu, unsigned long hz);
> >>   void kvm_reset_timer(struct kvm_vcpu *vcpu);
> >> diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
> >> index d53ab10f46..f4524fe866 100644
> >> --- a/arch/loongarch/kernel/fpu.S
> >> +++ b/arch/loongarch/kernel/fpu.S
> >> @@ -384,6 +384,7 @@ SYM_FUNC_START(_restore_lasx_upper)
> >>       lasx_restore_all_upper a0 t0 t1
> >>       jr    ra
> >>   SYM_FUNC_END(_restore_lasx_upper)
> >> +EXPORT_SYMBOL(_restore_lasx_upper)
> >
> > Why the added export? It doesn't seem necessary, given the previous
> > patch doesn't have a similar export added for _restore_lsx_upper. (Or
> > if it's truly needed it should probably become EXPORT_SYMBOL_GPL.)
> It is needed to be exported, as it is called by kvm_own_lasx. However
> the "_restore_lsx_upper" is not used in kvm.
To keep consistency it is better to export both.

Huacai

>
> Thanks
> Tianrui Zhao
>
