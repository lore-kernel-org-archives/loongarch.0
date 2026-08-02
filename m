Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944073B14C9
	for <loongarch@lists.linux.dev>; Sun,  2 Aug 2026 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785679924; cv=none; b=KtydvaWP5EuejbXbDgAvHlvPfszKkggLlyYwHLHLrn36mQzKWrlEauflyJd6DUAKeXoxrvO/TTvJZ537ghrvLLd/PVQ51/vf/j/Muu+HPENigXxyKploKhE4PoeJ5+mQft3KO1W0j/XSkieleFKbGoaFW1zT+vmVMoSv6w2z+GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785679924; c=relaxed/simple;
	bh=nBiE4GMFuidl6SmwfqgTA6a/OCpct1rW8PeNTCyFoRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPoQCYCLbG5ARgj1DWl/Hqu+ShCfpNn8zOiBlSpfX54VQsryNwV615WbnK8jVYTnkBWYzomJt0OtrwytQHT8qChITvN6k+N8oMHkKvpK/KYIuFGVlY0c6CraRX4nAR9Oj46TgAXIqjhjqZ+j/uXxAt1evhRNDTadFb0ACvZ3lwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHdWjULA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHdWjULA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7594D1F00ADB
	for <loongarch@lists.linux.dev>; Sun,  2 Aug 2026 14:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785679923;
	bh=4vGFf5sT3ykhrjtRMbdou3qpouyP9KFjubQiMUVNqCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lHdWjULA+BJH97p9HnkNUt4vzlzAiQJVU/MXk6IMxWD+Cp5WhyfWz2GB25Rv40VFi
	 Uhr+1EkaIauYANtjcqTiVEJqzDa8maPkg6+0iwqkZQqu7LRzjbn7ooFI8TUkgZYQ52
	 /OsVh25ERx+bSE/4J6Ne4SNbQTmsLPIFrZNm9IIKm2l7PSsQNakRdTZ+uydZXJaeST
	 Zjtbc1iXIXW1MfyDZ8ub1BVAXEHwYpv7wxvKgRfzytwFegtmG5tu1C8tOk7HAKtUF/
	 PM3dFiGd2bQHWvysZBQSjsblaGNvk2Ti+iJxWz4yQi1T9cUqC1S8Er/OFTduWfa7ce
	 1WvxoAbadzA/Q==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69c5fda04a8so4525719a12.1
        for <loongarch@lists.linux.dev>; Sun, 02 Aug 2026 07:12:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr9nKaEWFxqOiHB3OjYx2WWchW2tzpihmzITRvtx28YmgbbxzL+KRNQ3Eoy8BemJCx0QgW2NVBiL44=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8x9WNhv7K0gSKo92J28o22gYPitmqWK8LdFW7gl2BZ0rn1F6z
	xxihrSqcvkdKUTUV9a5II4ywZdCzVZQH0aHYK5Dsz2Bj0c4yeylUVUEoZti8dGwgis+xMgRPj8s
	rywtThC8S0rbDZvqVHu+27ao/46rdWL8=
X-Received: by 2002:a05:6402:4541:b0:6a0:a506:3dd2 with SMTP id
 4fb4d7f45d1cf-6a0a7ca2696mr3725296a12.18.1785679922012; Sun, 02 Aug 2026
 07:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727072109.2151675-1-maobibo@loongson.cn> <20260727072109.2151675-2-maobibo@loongson.cn>
In-Reply-To: <20260727072109.2151675-2-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 2 Aug 2026 22:11:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6sEXa6XM-4=OTuPw=gNKgVxC7ZwqO6T-F81pvt_gBN8Q@mail.gmail.com>
X-Gm-Features: AUfX_mwbodz2t9tT1MksfK3OdzQdyFdWAuG8pD6UTzkSpkTR-wbRAldRd07jjpY
Message-ID: <CAAhV-H6sEXa6XM-4=OTuPw=gNKgVxC7ZwqO6T-F81pvt_gBN8Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] LoongArch: KVM: Add vmid support for stage2 MMU
To: Bibo Mao <maobibo@loongson.cn>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>, Xi Ruoyao <xry111@xry111.site>, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

On Mon, Jul 27, 2026 at 3:29=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> LoongArch KVM hypervisor supports two-level MMU, vpid index is used
> for stage1 MMU and vmid index is used for stage2 MMU.
>
> On 3A5000, vmid must be the same with vpid. On 3A6000 platform vmid
> may separate from vpid. If vcpu migrate to different physical CPUs,
> vpid need change however vmid can keep the same with old value. Also
> vmid index of the while VM machine on physical CPU the same, all vCPUs
> on the VM can share the same vmid index on one physical CPU.
>
> Here vmid index is added and it keeps the same with vpid still.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/include/asm/kvm_host.h | 3 +++
>  arch/loongarch/kernel/asm-offsets.c   | 1 +
>  arch/loongarch/kvm/main.c             | 1 +
>  arch/loongarch/kvm/switch.S           | 5 ++---
>  arch/loongarch/kvm/tlb.c              | 5 ++++-
>  5 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/inclu=
de/asm/kvm_host.h
> index 23cfbecebbd7..ec7b0c402385 100644
> --- a/arch/loongarch/include/asm/kvm_host.h
> +++ b/arch/loongarch/include/asm/kvm_host.h
> @@ -189,6 +189,9 @@ struct kvm_vcpu_arch {
>         unsigned long host_tp;
>         unsigned long host_pgd;
>
> +       /* vmid info for guest VM */
> +       unsigned long vmid;
Put it near vpid?

> +
>         /* Host CSRs are used when handling exits from guest */
>         unsigned long badi;
>         unsigned long badv;
> diff --git a/arch/loongarch/kernel/asm-offsets.c b/arch/loongarch/kernel/=
asm-offsets.c
> index 1b861cbc5e10..32ef6adfc8dd 100644
> --- a/arch/loongarch/kernel/asm-offsets.c
> +++ b/arch/loongarch/kernel/asm-offsets.c
> @@ -300,6 +300,7 @@ static void __used output_kvm_defines(void)
>         OFFSET(KVM_ARCH_HSP, kvm_vcpu_arch, host_sp);
>         OFFSET(KVM_ARCH_HTP, kvm_vcpu_arch, host_tp);
>         OFFSET(KVM_ARCH_HPGD, kvm_vcpu_arch, host_pgd);
> +       OFFSET(KVM_ARCH_VMID, kvm_vcpu_arch, vmid);
>         OFFSET(KVM_ARCH_KVMPGD, kvm_vcpu_arch, kvm_pgd);
>         OFFSET(KVM_ARCH_HANDLE_EXIT, kvm_vcpu_arch, handle_exit);
>         OFFSET(KVM_ARCH_HEENTRY, kvm_vcpu_arch, host_eentry);
> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
> index 3e1005526f4b..6e3e8efa1dc2 100644
> --- a/arch/loongarch/kvm/main.c
> +++ b/arch/loongarch/kvm/main.c
> @@ -223,6 +223,7 @@ static void kvm_update_vpid(struct kvm_vcpu *vcpu, in=
t cpu)
>
>         context->vpid_cache =3D vpid;
>         vcpu->arch.vpid =3D vpid;
> +       vcpu->arch.vmid =3D vcpu->arch.vpid & vpid_mask;

I think both vpid and vmid need "& vpid_mask".


Huacai

>  }
>
>  void kvm_check_vpid(struct kvm_vcpu *vcpu)
> diff --git a/arch/loongarch/kvm/switch.S b/arch/loongarch/kvm/switch.S
> index 936e4ae3e408..af972394fd55 100644
> --- a/arch/loongarch/kvm/switch.S
> +++ b/arch/loongarch/kvm/switch.S
> @@ -66,9 +66,8 @@
>         ld.d    t0, a2, KVM_ARCH_KVMPGD
>         csrwr   t0, LOONGARCH_CSR_PGDL
>
> -       /* Mix GID and RID */
> -       csrrd           t1, LOONGARCH_CSR_GSTAT
> -       bstrpick.w      t1, t1, CSR_GSTAT_GID_SHIFT_END, CSR_GSTAT_GID_SH=
IFT
> +       /* Set VMID for gpa --> hpa mapping */
> +       ld.d            t1, a2, KVM_ARCH_VMID
>         csrrd           t0, LOONGARCH_CSR_GTLBC
>         bstrins.w       t0, t1, CSR_GTLBC_TGID_SHIFT_END, CSR_GTLBC_TGID_=
SHIFT
>         csrwr           t0, LOONGARCH_CSR_GTLBC
> diff --git a/arch/loongarch/kvm/tlb.c b/arch/loongarch/kvm/tlb.c
> index ebdbe9264e9c..38daf936021d 100644
> --- a/arch/loongarch/kvm/tlb.c
> +++ b/arch/loongarch/kvm/tlb.c
> @@ -23,7 +23,10 @@ void kvm_flush_tlb_all(void)
>
>  void kvm_flush_tlb_gpa(struct kvm_vcpu *vcpu, unsigned long gpa)
>  {
> +       unsigned int vmid;
> +
>         lockdep_assert_irqs_disabled();
>         gpa &=3D (PAGE_MASK << 1);
> -       invtlb(INVTLB_GID_ADDR, read_csr_gstat() & CSR_GSTAT_GID, gpa);
> +       vmid =3D (vcpu->arch.vmid << CSR_GSTAT_GID_SHIFT) & CSR_GSTAT_GID=
;
> +       invtlb(INVTLB_GID_ADDR, vmid, gpa);
>  }
> --
> 2.39.3
>
