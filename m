Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BB6323D
	for <loongarch@lists.linux.dev>; Wed, 26 Mar 2025 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743001796; cv=none; b=rqxV4Ocr8Fh6eNO2ko5KE2ZSegenm4zdpn46rtmI5kk72o1ZD36frcN8FxiVUspI45PkC2PVhRLcwtCMBCwpSapUcxy4B3Yvzp17OSSXqCSQQQPQCeqrkXHOMrBQTeTQ5HvWINFrEi39eLpYTtO0gEIr7XHXAfhXZhuhiMY9jj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743001796; c=relaxed/simple;
	bh=LvPznTTQMeL5HHEqwAw5mQEy+wnALOSIcXn/tKHfL/k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tbK8xk9gzhWuvuSc+9tl3xovXUGmtp20INaM0zfExRjYKwj5jUAeHO40ObmS2skD4ZcNiYqHxq7nEJ/mWfz71+CCvmG7HLu2VabXxOilq8OIVch1MziYBZhMBF8SVUw4ZEJL5fyb977jIoOifwzofqJBZJ1bSp1KCST74zA2ge0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DBm1t+B/; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DBm1t+B/"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so10722702a91.1
        for <loongarch@lists.linux.dev>; Wed, 26 Mar 2025 08:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743001794; x=1743606594; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkOqbfERQdrw9bi6YeAMxlXl0dXPXrj8aIpOruTKiGo=;
        b=DBm1t+B/fyCglFbMhlDXM+kY0K7Emq2CJyWM7aMu0Dm6/Gs5fM3hsKBk42Vi2oXWBc
         sqMLxemtBArPSJb3Ryxb74Pmj1aUyokIiSdr+XKTLwigy4WvP/b7a15riW8Q9gQYks07
         msxr8c7TEgjMDz327tYS6VSYhRV712d27qIqDEg34MTHnvWjMTtx3wn7JCQvaslmEWFu
         OlJoCmyWA7UUt5mMaq36WSi/a0dCbq87XYS7rrLmpn1yGPnbcC++HSS3gZKnV5+tuxVr
         wHNzTJZMbYQM2r77heI81rcdMPaKgDWvmnzFdgzcBidXJJODtq2AQSKmw2DlTTjPv9KV
         JBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743001794; x=1743606594;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FkOqbfERQdrw9bi6YeAMxlXl0dXPXrj8aIpOruTKiGo=;
        b=JCSjztd7F+ATzWwr2edVnYRxiJSHMfpgyk42dt41DW3MBtEKAJUVeT6UVAwiWVZyWR
         IUpOTHhdFZ96h3+4fAY39pkDF60k9YeyDFDkIOSbyCxI76qP8ki80bP+4rZvyzmWh+cL
         mvIGGlcKLuMlha793XGVKm6Y+IbJdI25PHnj+yB7h75gHPEwIX0KRB5a5GfPjejSXycd
         jrGUhQx+KCuXHaKkCyH/6qOmQQTj9NphxEOgvFZwDtu5VvtXGATs6uib6xS0QdPuQpft
         B6mtMsUou6rybThlnzpmTQ0PLBSAwZiaxovYB4GVPf6RQPYNmMhphyji6z44LoHo/tjN
         pBbA==
X-Forwarded-Encrypted: i=1; AJvYcCUn3rXP9VhPeaCiS/+9Yrv2JbSSP5ktJhbMkAzgJw+See+SpkCPg4fA0cP7IoYrMA9wrpT7TUYkky8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQh5L3nhZbT9wd3wI4aVGcrHgvljosXhOw2hKwbnlTLyqlZC6Y
	3r7H6OZV6DMqhLEAHn4DsJjm4CHkfgiz0Xr8/lFGdkUXUp0EvZOgYShoUKl1bWqK5jr6dX1HkG/
	E1w==
X-Google-Smtp-Source: AGHT+IGaEwe4msZVS1TKiQxfZo1Kl1wf0fVTRtC8U+SRmC7/tJzqPC3DpOBHSnHN51MOxacJYlojeP9LBP0=
X-Received: from pfbch5.prod.google.com ([2002:a05:6a00:2885:b0:730:96d1:c213])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9217:b0:1f5:6a1a:329b
 with SMTP id adf61e73a8af0-1fea2f635e9mr263486637.32.1743001794420; Wed, 26
 Mar 2025 08:09:54 -0700 (PDT)
Date: Wed, 26 Mar 2025 08:09:53 -0700
In-Reply-To: <c220d043-2314-85bb-e99d-dc2c609aa739@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250311074737.3160546-1-maobibo@loongson.cn> <c220d043-2314-85bb-e99d-dc2c609aa739@loongson.cn>
Message-ID: <Z-QYwWxhBH_nvmWH@google.com>
Subject: Re: [RFC V2] LoongArch: KVM: Handle interrupt early before enabling irq
From: Sean Christopherson <seanjc@google.com>
To: bibo mao <maobibo@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025, bibo mao wrote:
> Hi Paolo, Sean
>=20
> This idea comes from x86, do you have any guidance or suggestion about it=
?
>=20
> Also I notice that there is such irq_enable()/irq_disable() pair on x86, =
I
> do not know why it is so.

Because on AMD (SVM), IRQ VM-Exits don't consume the IRQ, i.e. the exit is =
purely
a notification.  KVM still needs to enable IRQs to actually handle the pend=
ing IRQ.
And if the IRQ that triggered VM-Exit is for the host's tick, then it's des=
irable
to handle the tick IRQ before guest_timing_exit_irqoff() so that the timesl=
ice is
accounted to the guest, not the host (the tick IRQ arrived while the guest =
was
active).

On Intel (VMX), KVM always runs in a mode where the VM-Exit acknowledge/con=
sumes
the IRQ, and so KVM _must_ manually call into the appropriate interrupt han=
dler.

>     local_irq_enable();
>     ++vcpu->stat.exits;
>     local_irq_disable();
>     guest_timing_exit_irqoff();
>     local_irq_enable();
>=20
> Regards
> Bibo Mao
>=20
> On 2025/3/11 =E4=B8=8B=E5=8D=883:47, Bibo Mao wrote:
> > If interrupt arrive when vCPU is running, vCPU will exit because of
> > interrupt exception. Currently interrupt exception is handled after
> > local_irq_enable() is called, and it is handled by host kernel rather
> > than KVM hypervisor. It will introduce extra another interrupt
> > exception and then host will handle irq.
> >=20
> > If KVM hypervisor detect that it is interrupt exception, interrupt
> > can be handle early in KVM hypervisor before local_irq_enable() is
> > called.

The correctness of this depends on how LoongArch virtualization processes I=
RQs.
If the IRQ is consumed by the VM-Exit, then manually handling the IRQ early=
 is
both optimal and necessary for correctness.  If the IRQ is NOT consumed by =
the
VM-Exit, then manually calling the interrupt handler from KVM will result i=
n every
IRQ effectively happening twice: once on the manual call, and against when =
KVM
enables IRQs and the "real" IRQ fires.
