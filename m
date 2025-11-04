Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C76321442
	for <loongarch@lists.linux.dev>; Tue,  4 Nov 2025 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279134; cv=none; b=RpLaZEa0EpMLfWfrHPh7XInOgk09kCmJiBloSoZij5jT6dVDu/lorD8kXqjObT4jzDnrpFVmtU7oUzEeWvIarSW9tk8i2ws+FBf+FmOExhUI3y2QBO6jnwLS9chWf5V8Pk3IVjDX9M2/0mwLg/2oJIziqbQcxD1t0gjFTpuhTDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279134; c=relaxed/simple;
	bh=M8hteS49kDBBnmC972KvrKrHthGw8+MuUqHN8fekdI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rGkLZrI1xE7YAafoPoYNMXljjri13hb8Ck/DCIT78XvwODJGEb2F0Y2boY5NojVgQJuMvwK00JMZ/PH5lkw8+5QheHkP0rdn2Z8lNogOOmdQMH1ai9rX0fPyKVEckfbueO1rPxZCuvpgRRDWHm66a73soMMXV5LGYI5MaFv7hmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i2EEXFUB; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i2EEXFUB"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-295b713530cso31598865ad.1
        for <loongarch@lists.linux.dev>; Tue, 04 Nov 2025 09:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762279133; x=1762883933; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=;
        b=i2EEXFUBHuwagC+kMk79vVd2aD7DCiN1nkmaS44FfdLa/TTxYN2ATXfkMuQhy/5OMd
         7+obpxLFZQSOS6DuZ+b3nVriWZGaH1V3O/fk2rf7FROHcbxtbvoZ9kpbY2CIfkYqOzNM
         5fLGqfLafW0xjTMFP9n70eXwjOY5xBhCYIseoyEXabXNsV+8CHigp7BaK5rS77/uujrp
         Rg5XZjwl1pRKNtUZILquiWHT0eGmwNU7ZQ6E+yMpLl9BfCo19n4V9sa6fo8GLbDbVYMF
         oid2qM3RZaY7Dh7twBBJoK1fAk/lxEfsmccGriCuW4l38jvkp1fYR5RXpPltENmQ12JA
         ZhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279133; x=1762883933;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=;
        b=sFdrHRx93v5WpkPHhIlY04fv96aEGdnsilrhIx+c94R1E/LBO0p0wnszkGbDZFjuqr
         qaGSAPFNXW0c1n+d4gTKbE+YtISx41fl1NEaKiqBG8nH3Odu5IbIrZTX4LD9DSYU/z0q
         nGim/u9Y9RnsYPFU4qkgBEbWkJLbZRQZTLcRxFg0e/LDlPJNJHXuf8VwjmqGsBXwfMh1
         qmfQ3zVqY3MfCBhvMJDvEhn83hAo1ZmXs78X061+iZqbQxPRBcT2YgG2JUWwYaW1oTyV
         XJ0eTwzPyAf6nybXfxPOf3ZzbtlH1t0iW6F3X7xrb3Na1HKFYHDAPUn9k8w2VsxwowSV
         iDSw==
X-Forwarded-Encrypted: i=1; AJvYcCUqlQzvfvW5D4kAS/etq5Vve4IAbqBzYhq7qe5kdfHgXC1xRO+MhGu+8LTCMh5e4O0ZlrDK6HRCqLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTdmX9OmhJyti3NDH3Ta43Woq2iAnBWa5BwtEA0oGsNifycZ0r
	fTOFNmdOiiphrfOxUZajVoP8/kb8PwyY6SVqeET18EKfsrTjBWXnCozcdELlRPn8IRyaHA4D4dr
	j3KyN9w==
X-Google-Smtp-Source: AGHT+IHo6/KH4EkXGXP40ZLufzSsgW7yh9/qU70MiYfxQR70XqX2CyQgg6697l1DVe5Ug6vhYlNvwdh/uJA=
X-Received: from plok6.prod.google.com ([2002:a17:903:3bc6:b0:269:8ca7:6998])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f609:b0:295:4d97:84dd
 with SMTP id d9443c01a7336-2962adb8f9cmr4243385ad.51.1762279132506; Tue, 04
 Nov 2025 09:58:52 -0800 (PST)
Date: Tue, 4 Nov 2025 09:58:48 -0800
In-Reply-To: <725c68f2607ad2d4f742fd749ea517a98d669384.camel@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <725c68f2607ad2d4f742fd749ea517a98d669384.camel@intel.com>
Message-ID: <aQo-2OQd8ktU0ygn@google.com>
Subject: Re: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-10-30 at 13:09 -0700, Sean Christopherson wrote:
> > v4:
> > =C2=A0- Collect reviews/acks.
> > =C2=A0- Add a lockdep assertion in kvm_tdp_mmu_map_private_pfn(). [Yan]
> > =C2=A0- Wrap kvm_tdp_mmu_map_private_pfn() with CONFIG_KVM_GUEST_MEMFD=
=3Dy. [test bot]
> > =C2=A0- Improve (or add) comments. [Kai, and probably others]
> > =C2=A0- s/spte/mirror_spte to make it clear what's being passed in
> > =C2=A0- Update set_external_spte() to take @mirror_spte as well. [Yan]
> > =C2=A0- Move the KVM_BUG_ON() on tdh_mr_extend() failure to the end. [R=
ick]
> > =C2=A0- Take "all" the locks in tdx_vm_ioctl(). [Kai]
> > =C2=A0- WARN if KVM attempts to map SPTEs into an invalid root. [Yan]
> > =C2=A0- Use tdx_flush_vp_on_cpu() instead of tdx_disassociate_vp() when=
 freeing
> > =C2=A0=C2=A0 a vCPU in VCPU_TD_STATE_UNINITIALIZED state. [Yan]
>=20
> Do you want someone to follow up with a v2 of this after the series lands=
? (with
> Binbin's verbiage comments incorporated)

Feel free to send a v2 now.  Or just reply to Binbin's mail with the update=
d
comment.

> https://lore.kernel.org/kvm/20251028002824.1470939-1-rick.p.edgecombe@int=
el.com/#t
