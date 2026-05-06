Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248C644D685
	for <loongarch@lists.linux.dev>; Wed,  6 May 2026 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075760; cv=none; b=Ii0rfNP92Ud0FEfu5QiMBgRegLsx55jNrSS1AcEYrvaR9B7UMFOwSTuplAJV6vi1wwXcYOr1yVnyV7x8WIiqzsG7fe61EDq+lZpkSu1FMTIlL5P427YqR55OgSYtAPkebeMw98NvQ9TYhnTPITrmvEWEbQHZ0ls7k3QopkFZc2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075760; c=relaxed/simple;
	bh=c0e1ggcHk4GyWewOlfjR//jnwbcV2ZsEgEWocurLquw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U9rxXo/NtSruIF2LU14UnF98Vf99KR6JvBb2KkevRka9WZDSfyawLQqZK20CYiWUvWqXS09XQC/AMP5bHH1WCOtYC9q/7iHlXOvDaK1vCNoL3SsguOXkhscKKFUQBSw/0LylwCHAtxE4ViqqGaGEwb9qEmiFC0iYGQb9cr6vsew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F+HVD60e; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F+HVD60e"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b458add85aso58637625ad.2
        for <loongarch@lists.linux.dev>; Wed, 06 May 2026 06:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778075759; x=1778680559; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkcGmXg709UchoeBb+ayEFY84FKzk00zigTRHZ9oDz0=;
        b=F+HVD60eAqzYqpV+Je+dLHRCT69hGaVpw72AoEq6NByKZJgSZa8AQNJpsnTyXAACe3
         Q0+MryMYSCMqsJTOu3tlkQSuio3jfJEnMvIjkcaX22S6kkFjSRl/7dSix7tVSPOe0rGY
         80xCW9LeuwCJQcixRaVrMio9MdbQ+XVdq2TEzzuCI9ftBfCNED95pnV0hIG5ReTelHfh
         kRvX8HZmtdIKiyI5IdAvD/qpZygLHcWTcNnPAGhARONTe47eGL5yZK2DbE/tJdHXTIeh
         oMnLq0ziAIbJiq6VXOuBTxt7IIW0W8eqsEASoTGq7awXz51kpAVpkPgHF2Uoe/jIfxeJ
         kr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778075759; x=1778680559;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gkcGmXg709UchoeBb+ayEFY84FKzk00zigTRHZ9oDz0=;
        b=kDBvxiUswHppf6IXdis0c9Dkw8TmvmHFSVVqrwLC8LQEGYKRugwnCn9R6c0i1Ua5yG
         2lmw7znFEZEJiAnVvXaD/QMmt/XlfrZaWVmQ0i0qgYOjnn9/CGyupNPeveQJdlXoWaAA
         iOaqXVBKWX5P4J+nTAp+3DZkJn0KFNtNMui2Y5QDW5WK3dTUUNs/dQ3KKZdgxF3lf2vI
         Niid8cW47Uh01uUhxwa8Hsf6ZMIASDxQo9ni2l4T/EcLbHsKPGnW4kSGBihrI9w032bm
         CF3CM1AC0kkJdGAo3Pj+a/ph9nuukaZfuT0FJzy8+zCxJwuuJytE1VNx7osiB6HTM1lG
         0qYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/L6/wdamNbRMr4ELCm8xIh0JemN9UYc6QdZU8pm8XSovOTSgd8hGPHJSUfK0xVJ1obxrHOQC4Z9D4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXu0eKkW9Og9CsHeu/ns3mjC9qo4SmvtKDqTNFuqUuIJz5trp8
	eggfi+IY3EUSc0BniDiWAU8oJ3vfC82/Fpbof6wUtEinKi9f8kpdff8LVQLzz2tkTu49uCJaRCu
	yjAGL0Q==
X-Received: from pllt5.prod.google.com ([2002:a17:902:dcc5:b0:2b2:48d8:c695])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d07:b0:2b2:ebed:7af8
 with SMTP id d9443c01a7336-2ba78b3ffdamr36929145ad.1.1778075758298; Wed, 06
 May 2026 06:55:58 -0700 (PDT)
Date: Wed, 6 May 2026 06:55:57 -0700
In-Reply-To: <25838e74-01dd-d085-395b-676266dc9a9a@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260504224213.1049426-1-jthoughton@google.com>
 <20260504224213.1049426-2-jthoughton@google.com> <25838e74-01dd-d085-395b-676266dc9a9a@loongson.cn>
Message-ID: <aftIbW9G4RfoTuXh@google.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
From: Sean Christopherson <seanjc@google.com>
To: Bibo Mao <maobibo@loongson.cn>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Ricardo Koller <ricarkol@google.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, James Hogan <jhogan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026, Bibo Mao wrote:
> On 2026/5/5 =E4=B8=8A=E5=8D=886:42, James Houghton wrote:
> > kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
> > concurrently in the event that the KVM's `mm` is __mmput() at the
> > same time that last reference to the KVM is being dropped.
> >=20
> > T1              T2
> > KVM_CREATE_VM
> >                  Get VM file from T1
> > close VM
> > exit_mm()       close VM
> >=20
> > T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
> >      with only the KVM srcu read lock held.
> >=20
> > T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
> >      kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
> >      again, with only the KVM srcu read lock held.
> By looking through the code, kvm_arch_destroy_vm() will free PGD page onl=
y,
> page table walking is executing in deleting memslot or exit_mm().
>=20
> With normal code, life cycle of VM is something like this:

Not necessarily.  Abruptly closing the VM, as described below, is also "nor=
mal"
(though likely uncommon).

>   KVM_CREATE_VM
>     Create_VCPUs
>     Create memslots
>     Destroy_VCPUs

This is incorrect.  KVM doesn't provide any way for userspace to destroy vC=
PUs.
Userspace can fully release every vCPU fd, but the vCPU object within KVM s=
tays
alive (and indirectly reachable) until the VM is destroyed.

>     Destroy memslots
>   close VM
>   exit_mm()

Note, exit_mm() may or may not be called.  E.g. there are VMMs that will de=
stroy
a VM and start a new one (perhaps even the same conceptual virtual machine)=
 in
the same process / mm_struct / address space.

> And there is kvm_get_kvm()/kvm_put_kvm() function call with creating/dest=
roy
> vCPUs, however no such operations with memslot operation. Is it possible
> that VM is destroyed without removing memslots, such as the following
> operation.
>   KVM_CREATE_VM
>     Create memslots
>   close VM
>   exit_mm()

Yep.  KVM cannot make any assumptions when it comes to userspace-initiated
operations.  Even a VMM that super strictly follows the first approach may =
exit
abruptly, without destroying memslots, e.g. if it's OOM-killed.
