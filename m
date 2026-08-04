Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8183E6DD5
	for <loongarch@lists.linux.dev>; Tue,  4 Aug 2026 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785852917; cv=none; b=oSTXqbQYvBm2I6Wv2rDZlG//h09JpeLOHmg1K77pVNyUo9FgC6TqfgVeRdCvDqoTLSdD5Y0vQm4+ROK8TnYXV36pdI5DqpnRxWQKFDOsFZ+y+zKLO3RZKAokBjzZcAqZ4PZ180ymSgq1KUbfOKqnMMOmBdVk8P6CKhEe+o/zUNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785852917; c=relaxed/simple;
	bh=hbJ62aqpLTsM66S6wHrku8hFAvk5HdEuTAAR3gH0Ul4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMuEra/wg7sL0bbrbu29Sju3yvWC/6ThsdqDmA8LWv4666NP0YdRQaHrr4dym5G+F/5CQ4sNp6GkeYvP4OrAo6SIXLJjjc2kHc5XeFoSDQt36zFZImy3COXsER1uyvi/Kdac70crHt4z89zzBzaidJXDer6fwBGIipXUzWQ2dSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4DGjquK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4DGjquK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C241F00A3A
	for <loongarch@lists.linux.dev>; Tue,  4 Aug 2026 14:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785852900;
	bh=CPZMZqBF06dOeVIaCafEAQlSYdT1fcS0N4LwzoJzryA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=k4DGjquKRxnqnr/gYhqZD0P/X56SPjoMWBiwkNqbKXacgc+xxRdA4G0Je4qK10dTK
	 E02RLNPh5NAM4SMyNc2Soa4YBHKEi5nLXcI7kx7fW8rRLOGFby412LNi7fitrlXZ8p
	 /TZnB9eypsxTFXLdzWZdQmkyuSoZDiIpSsj4TpLu4EdsuuwZHJc4zQOFCq0i0GwkD9
	 DPHAicmTpz9HXo/++4xViPEFO2S2BpJ5mjGoO+Yu5GONe28DL1YUghlxcoKhxiUXlE
	 2/RR0BQRzL0BgDMZRoyESMnMVOFERQim6C0CcB5EHiTPr4ja/nHo1o7Msr6TaFwFfR
	 OyilaibHWCY/w==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso6099518a12.3
        for <loongarch@lists.linux.dev>; Tue, 04 Aug 2026 07:15:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoyJ+jZ4KeTiEXGOiMA0QgRJjfHWod5fqmR2/cCHCc0XAuKd/bxNUXveIxwaH2D1FnSmj/UwRH1e2A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxutg8i0Q7nkeDhjIE5ptpBaSmJoz9hgF5Z/j09k5tXkJe5aYGp
	UCSCr3Bi8fY/ZFuf7+k8I3aV4o6GXaHzhI63zghXHUeWn7PaK5ryJ/lyWEtj1s8sVev6StQGzbk
	X40kqXCj/SL87FyLYQLewFdL6Ldq6KKw=
X-Received: by 2002:a05:6402:52d1:b0:69e:8ad:5162 with SMTP id
 4fb4d7f45d1cf-6a0a7c60ee0mr12411296a12.1.1785852899218; Tue, 04 Aug 2026
 07:14:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727072109.2151675-1-maobibo@loongson.cn> <20260727072109.2151675-2-maobibo@loongson.cn>
 <CAAhV-H6sEXa6XM-4=OTuPw=gNKgVxC7ZwqO6T-F81pvt_gBN8Q@mail.gmail.com> <dc67eb43-adb2-c26b-a54f-ccd52ce910eb@loongson.cn>
In-Reply-To: <dc67eb43-adb2-c26b-a54f-ccd52ce910eb@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 4 Aug 2026 22:14:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7C+NbBOWtypwaLrn5Ehc6kv=W2jABz=r4O941QjAWhvQ@mail.gmail.com>
X-Gm-Features: AUfX_myE34GOouLsv_7onMyDrRdwXubQq2NijLpSA5X_wQqWY1OkBrLGAqUQu3E
Message-ID: <CAAhV-H7C+NbBOWtypwaLrn5Ehc6kv=W2jABz=r4O941QjAWhvQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] LoongArch: KVM: Add vmid support for stage2 MMU
To: Bibo Mao <maobibo@loongson.cn>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>, Xi Ruoyao <xry111@xry111.site>, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:21=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
>
>
> On 2026/8/2 =E4=B8=8B=E5=8D=8810:11, Huacai Chen wrote:
> > Hi, Bibo,
> >
> > On Mon, Jul 27, 2026 at 3:29=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >> LoongArch KVM hypervisor supports two-level MMU, vpid index is used
> >> for stage1 MMU and vmid index is used for stage2 MMU.
> >>
> >> On 3A5000, vmid must be the same with vpid. On 3A6000 platform vmid
> >> may separate from vpid. If vcpu migrate to different physical CPUs,
> >> vpid need change however vmid can keep the same with old value. Also
> >> vmid index of the while VM machine on physical CPU the same, all vCPUs
> >> on the VM can share the same vmid index on one physical CPU.
> >>
> >> Here vmid index is added and it keeps the same with vpid still.
> >>
> >> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> >> ---
> >>   arch/loongarch/include/asm/kvm_host.h | 3 +++
> >>   arch/loongarch/kernel/asm-offsets.c   | 1 +
> >>   arch/loongarch/kvm/main.c             | 1 +
> >>   arch/loongarch/kvm/switch.S           | 5 ++---
> >>   arch/loongarch/kvm/tlb.c              | 5 ++++-
> >>   5 files changed, 11 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/in=
clude/asm/kvm_host.h
> >> index 23cfbecebbd7..ec7b0c402385 100644
> >> --- a/arch/loongarch/include/asm/kvm_host.h
> >> +++ b/arch/loongarch/include/asm/kvm_host.h
> >> @@ -189,6 +189,9 @@ struct kvm_vcpu_arch {
> >>          unsigned long host_tp;
> >>          unsigned long host_pgd;
> >>
> >> +       /* vmid info for guest VM */
> >> +       unsigned long vmid;
> > Put it near vpid?
> yes, it it better to near vpid. will do this.
> >
> >> +
> >>          /* Host CSRs are used when handling exits from guest */
> >>          unsigned long badi;
> >>          unsigned long badv;
> >> diff --git a/arch/loongarch/kernel/asm-offsets.c b/arch/loongarch/kern=
el/asm-offsets.c
> >> index 1b861cbc5e10..32ef6adfc8dd 100644
> >> --- a/arch/loongarch/kernel/asm-offsets.c
> >> +++ b/arch/loongarch/kernel/asm-offsets.c
> >> @@ -300,6 +300,7 @@ static void __used output_kvm_defines(void)
> >>          OFFSET(KVM_ARCH_HSP, kvm_vcpu_arch, host_sp);
> >>          OFFSET(KVM_ARCH_HTP, kvm_vcpu_arch, host_tp);
> >>          OFFSET(KVM_ARCH_HPGD, kvm_vcpu_arch, host_pgd);
> >> +       OFFSET(KVM_ARCH_VMID, kvm_vcpu_arch, vmid);
> >>          OFFSET(KVM_ARCH_KVMPGD, kvm_vcpu_arch, kvm_pgd);
> >>          OFFSET(KVM_ARCH_HANDLE_EXIT, kvm_vcpu_arch, handle_exit);
> >>          OFFSET(KVM_ARCH_HEENTRY, kvm_vcpu_arch, host_eentry);
> >> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
> >> index 3e1005526f4b..6e3e8efa1dc2 100644
> >> --- a/arch/loongarch/kvm/main.c
> >> +++ b/arch/loongarch/kvm/main.c
> >> @@ -223,6 +223,7 @@ static void kvm_update_vpid(struct kvm_vcpu *vcpu,=
 int cpu)
> >>
> >>          context->vpid_cache =3D vpid;
> >>          vcpu->arch.vpid =3D vpid;
> >> +       vcpu->arch.vmid =3D vcpu->arch.vpid & vpid_mask;
> >
> > I think both vpid and vmid need "& vpid_mask".
> vpid used in function kvm_check_vcpuid() includes version information
> also. vmid here is hardware id directly used by LOONGARCH_CSR_GTLBC in
> arch/loongarch/kvm/switch.S.
I'm not sure, but it seems both vpid and vmid have a sw version and a
hw version? The hw version will be written into register so its width
is limited, while the sw version is 64bit. If I'm right, I think the
"& vpid_mask" is only used when writing registers, in other places
they are full 64bit (in other words, they need the same treatment).

Huacai

>
> Regards
> Bibo Mao
> >
> >
> > Huacai
> >
> >>   }
> >>
> >>   void kvm_check_vpid(struct kvm_vcpu *vcpu)
> >> diff --git a/arch/loongarch/kvm/switch.S b/arch/loongarch/kvm/switch.S
> >> index 936e4ae3e408..af972394fd55 100644
> >> --- a/arch/loongarch/kvm/switch.S
> >> +++ b/arch/loongarch/kvm/switch.S
> >> @@ -66,9 +66,8 @@
> >>          ld.d    t0, a2, KVM_ARCH_KVMPGD
> >>          csrwr   t0, LOONGARCH_CSR_PGDL
> >>
> >> -       /* Mix GID and RID */
> >> -       csrrd           t1, LOONGARCH_CSR_GSTAT
> >> -       bstrpick.w      t1, t1, CSR_GSTAT_GID_SHIFT_END, CSR_GSTAT_GID=
_SHIFT
> >> +       /* Set VMID for gpa --> hpa mapping */
> >> +       ld.d            t1, a2, KVM_ARCH_VMID
> >>          csrrd           t0, LOONGARCH_CSR_GTLBC
> >>          bstrins.w       t0, t1, CSR_GTLBC_TGID_SHIFT_END, CSR_GTLBC_T=
GID_SHIFT
> >>          csrwr           t0, LOONGARCH_CSR_GTLBC
> >> diff --git a/arch/loongarch/kvm/tlb.c b/arch/loongarch/kvm/tlb.c
> >> index ebdbe9264e9c..38daf936021d 100644
> >> --- a/arch/loongarch/kvm/tlb.c
> >> +++ b/arch/loongarch/kvm/tlb.c
> >> @@ -23,7 +23,10 @@ void kvm_flush_tlb_all(void)
> >>
> >>   void kvm_flush_tlb_gpa(struct kvm_vcpu *vcpu, unsigned long gpa)
> >>   {
> >> +       unsigned int vmid;
> >> +
> >>          lockdep_assert_irqs_disabled();
> >>          gpa &=3D (PAGE_MASK << 1);
> >> -       invtlb(INVTLB_GID_ADDR, read_csr_gstat() & CSR_GSTAT_GID, gpa)=
;
> >> +       vmid =3D (vcpu->arch.vmid << CSR_GSTAT_GID_SHIFT) & CSR_GSTAT_=
GID;
> >> +       invtlb(INVTLB_GID_ADDR, vmid, gpa);
> >>   }
> >> --
> >> 2.39.3
> >>
>
