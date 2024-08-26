Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E4D18F2FF
	for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683755; cv=none; b=FIr9YxOPjLTMuoYeLQNzsLHn7jd67G4yqxCyk868GhgiSQZ9KpfrEuVWfNTVTvKyml7HGMlxKNuZ0uWLeCqPqPpmJ7bIuMDf62EZZp6qeMMBIoroUEBHa5kMLJbltDODiikCdFG9Hv8Jern26IBzms+W99pK9LoZPe7dFQ8bUnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683755; c=relaxed/simple;
	bh=uJYKJP5u52gdFIEA/SVCvB+nGTPXrfaICxlVLoVHi2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rECpEEpTnEcgs4wJzkwgtKN2uLDsf9nXbAxmwCxh6KRdMTxXIZ/JPO+n53BjmTVVCuFdKfcPfCicYz82slGkcMyGXBgB2+TvaBjU035U7SBgvAzK6jYg1F2aiOmQWU10P/pxX82YnxwC+JJL+y5du9zqfTDT4vMWusyEkeoQdEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKFV+e3n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKFV+e3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E918C52FD3
	for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683755;
	bh=uJYKJP5u52gdFIEA/SVCvB+nGTPXrfaICxlVLoVHi2s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BKFV+e3nTLbba7IfKYx158sxITogkHLfTfOtpil0XHPhMV9Zmrrx7saeH7i0FatzN
	 pH4dfnLKKDajT5BGfYPv6qcGfjsJrfwLUZfbMQ3VX9HqBHvG3++Km3rXSREFYrRu69
	 QAz/VWsd3lp2t44BXlXvVpapyjkrh7f3xlFSXRSWjxzG4LomGQvcuwmmUe4wwbhBmR
	 lXlwydJITijynzn75CON8Gn6S65QzsmWK/Sy8QF+cWZIjWyJYuTVIihgh+rBGPh7eH
	 yNWTCXrqyzC3/QTg397PRzCCNfbol+NWeq+FLFX7brKLCUwH7DlqjN+ee/rjV6Spyg
	 K4Du7yX91obcA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bed83488b6so5031259a12.2
        for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 07:49:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdf3o0plZnH9DV0R09Vs8xF0NvdeC0+g9EDLBELwuX9Xv8D3B59isowb2P01wawRKbHivZO87Srcg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuqIuj6nt6G4A2OBy+krYUX/c/KEHFrHB8sumOeT9ZCnudwkVE
	6tT8oHd3vzCBe2AxqSzLFTQNstgxmUrHiUEdmalBY6gWpGNa0VQwNk4ziZi1bryPjWm3N1GmbMa
	uCK3KtE3U0nm2GosJPnbrxibsVrY=
X-Google-Smtp-Source: AGHT+IEKLWSILwx6ptoGTQB05HFx+Gqpr+sIMMEXlrHqdZkcGukYw7IXUkPbpM5O4I3GA/JSm4pX8x1fFvrSKY7gjU4=
X-Received: by 2002:a05:6402:5cc:b0:5bf:50:266b with SMTP id
 4fb4d7f45d1cf-5c089171b3fmr6351964a12.19.1724683753967; Mon, 26 Aug 2024
 07:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815071545.925867-1-maobibo@loongson.cn> <20240815071545.925867-3-maobibo@loongson.cn>
In-Reply-To: <20240815071545.925867-3-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 26 Aug 2024 22:49:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5_xrmDVTiB=un7LzdLHQDjD564tVmVcHLrgGhhX6Omaw@mail.gmail.com>
Message-ID: <CAAhV-H5_xrmDVTiB=un7LzdLHQDjD564tVmVcHLrgGhhX6Omaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] LoongArch: KVM: Invalid guest steal time address
 on vCPU reset
To: Bibo Mao <maobibo@loongson.cn>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Aug 15, 2024 at 3:15=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> If paravirt steal time feature is enabled, there is percpu gpa address
> passed from guest vcpu and host modified guest memory space with this gpa
> address. When vcpu is reset normally, it will notify host and invalidate
> gpa address.
>
> However if VM is crashed and VMM reboots VM forcely, vcpu reboot
> notification callback will not be called in VM, host needs invalid the
> gpa address, else host will modify guest memory during VM reboots. Here i=
t
> is invalidated from vCPU KVM_REG_LOONGARCH_VCPU_RESET ioctl interface.
>
> Also funciton kvm_reset_timer() is removed at vCPU reset stage, since SW
> emulated timer is only used in vCPU block state. When vCPU is removed
> from block waiting queue, kvm_restore_timer() is called and SW timer
> is cancelled. And timer register is cleared at VMM when vCPU is reset.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/include/asm/kvm_vcpu.h | 1 -
>  arch/loongarch/kvm/timer.c            | 7 -------
>  arch/loongarch/kvm/vcpu.c             | 2 +-
>  3 files changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/kvm_vcpu.h b/arch/loongarch/inclu=
de/asm/kvm_vcpu.h
> index c416cb7125c0..86570084e05a 100644
> --- a/arch/loongarch/include/asm/kvm_vcpu.h
> +++ b/arch/loongarch/include/asm/kvm_vcpu.h
> @@ -76,7 +76,6 @@ static inline void kvm_restore_lasx(struct loongarch_fp=
u *fpu) { }
>  #endif
>
>  void kvm_init_timer(struct kvm_vcpu *vcpu, unsigned long hz);
> -void kvm_reset_timer(struct kvm_vcpu *vcpu);
>  void kvm_save_timer(struct kvm_vcpu *vcpu);
>  void kvm_restore_timer(struct kvm_vcpu *vcpu);
>
> diff --git a/arch/loongarch/kvm/timer.c b/arch/loongarch/kvm/timer.c
> index bcc6b6d063d9..74a4b5c272d6 100644
> --- a/arch/loongarch/kvm/timer.c
> +++ b/arch/loongarch/kvm/timer.c
> @@ -188,10 +188,3 @@ void kvm_save_timer(struct kvm_vcpu *vcpu)
>         kvm_save_hw_gcsr(csr, LOONGARCH_CSR_ESTAT);
>         preempt_enable();
>  }
> -
> -void kvm_reset_timer(struct kvm_vcpu *vcpu)
> -{
> -       write_gcsr_timercfg(0);
> -       kvm_write_sw_gcsr(vcpu->arch.csr, LOONGARCH_CSR_TCFG, 0);
> -       hrtimer_cancel(&vcpu->arch.swtimer);
> -}
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 16756ffb55e8..6905283f535b 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -647,7 +647,7 @@ static int kvm_set_one_reg(struct kvm_vcpu *vcpu,
>                                 vcpu->kvm->arch.time_offset =3D (signed l=
ong)(v - drdtime());
>                         break;
>                 case KVM_REG_LOONGARCH_VCPU_RESET:
> -                       kvm_reset_timer(vcpu);
> +                       vcpu->arch.st.guest_addr =3D 0;
>                         memset(&vcpu->arch.irq_pending, 0, sizeof(vcpu->a=
rch.irq_pending));
>                         memset(&vcpu->arch.irq_clear, 0, sizeof(vcpu->arc=
h.irq_clear));
>                         break;
> --
> 2.39.3
>
