Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D173E717B
	for <loongarch@lists.linux.dev>; Tue,  5 May 2026 18:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005012; cv=none; b=CS70LvIy/X1GPExs0c2ZEqPqw/miwO1i3oWlOj12o+e0Z0EnGHQL+gMjjB6AYxVeENUuO2hktiUtcu4qHckqD6fnQkqPUP1x6a9XbI/reCImHksnazpjWRuQid28KgudzmitI5BhwkqjY4T2xTlXZsWHhgdMsuBm0UUn5Na2h+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005012; c=relaxed/simple;
	bh=jJt54MpFxQg6JNI2urKnLlI3egsp9pP5s8P+shBJ5y4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qLz/KeuRKmsPSu/THvHZmFYOvZfSmZE3tSDz6pYrDWChNfMggFbL3D+DhoCzv2rBg/ErX37aRC2yERmDKlxvPoPA8lukEPY1PpJiLOdAhQljaaE8jZ1uNev5mX6P3ZIfURZJX26XXQOF8xbOHJRYsaxQHpJR7RGGc1f8Cl+qx4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q0EVFzKU; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q0EVFzKU"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b9f5ac4e36so28920195ad.2
        for <loongarch@lists.linux.dev>; Tue, 05 May 2026 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778005011; x=1778609811; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luNYyBAnxJ4nZFqNusK+zieJvfObwASYFJHRx4I4bUc=;
        b=Q0EVFzKUrv1Tm960j/fIc/hHiTJjwHwvqZaUZuc88aIoY/OWBO+3JDf3H/+VILQ/Q1
         Gi4tW1ZBZZ4pmwXejnt2QhhdkT3ee5oPoRiJIKQcFmcul+quWiO4M5ycGoLVMtxwxrxs
         Q7imfSciy2u7FKRghdq3qwy1I+FaNSZ2r+kjBm1AAtZzJoCWgKmfEQ202DycMjzyEQAH
         cWF82prP11HrYuqwqRkam4Ntdy+UPqzQ36QLiOFR50QqvizGZbqm48Amxv3+LpzaOTUm
         GHPqTBs4hIoo34PuLH8pjc1lkPqnHhKVaPSBYiY/BgOUDD9llqhZFdYf4dbWRn7Vpgke
         N/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005011; x=1778609811;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=luNYyBAnxJ4nZFqNusK+zieJvfObwASYFJHRx4I4bUc=;
        b=Ri5hMWC3Y7uRfhNO9a+/A71GdwZWNET0G4ahrL/3mHjkmhDfXbaQtv6KPbbjTWwwbJ
         /LfHUXq2bNdIbAkP+i+Q+evNRxyodfTNh7Ni8PP4tZE2tx1txPyeYhmddXmQCcV71v4S
         JuFUSviLo5f1v1tivILZmbUx1XiV2foI2wn3QAj2b/rfVKqUmXdxphjjVbP2bTkZjcza
         IhZURskhhN6+BzGk073TQOOZIbg25NpFhSuJ5Hl5teCgcNTzELU0X+Pp6v8LJ0pIpj2o
         NZRMLNKNidrhqY0rMASabk+UhLQottrsFZYa6STL3nVp8/kNu+vQMfQRq7z1WhBXKeSj
         mSew==
X-Forwarded-Encrypted: i=1; AFNElJ8HCSjHbnMkNBb1BZdU+cF/JAKqjKYW1fWKJ5auw6dMhl0ec3TlAEnqiDqXiAQX4QmXA43rsNbmKk8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9yY12AahA+GYG5nGLhwKwfxhY3Z+UiVMeQDHLugHWOPSzur/z
	t2d9CSUpSkiRdHVj1WPS14bYq/DpHHYtDG1go1L16umI6ZmKu5PP/dT/P6avuX7y3j3D98omUEg
	T2rCilQ==
X-Received: from plof8.prod.google.com ([2002:a17:902:8608:b0:2b2:5117:a3f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b03:b0:2b9:ff02:a15a
 with SMTP id d9443c01a7336-2ba794c3003mr848615ad.9.1778005010714; Tue, 05 May
 2026 11:16:50 -0700 (PDT)
Date: Tue, 5 May 2026 11:16:50 -0700
In-Reply-To: <CADrL8HX223b3YS8aHr7b=AZZ2J5ga+-SwLQX9Rs9Ep=rMM5wUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com>
 <20260504231048.1184273-1-jthoughton@google.com> <afohshVlK9YcBk-f@google.com>
 <CADrL8HX223b3YS8aHr7b=AZZ2J5ga+-SwLQX9Rs9Ep=rMM5wUA@mail.gmail.com>
Message-ID: <afo0Er7R4MnMP0MB@google.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: chenhuacai@kernel.org, gshan@redhat.com, jhogan@kernel.org, 
	joey.gouly@arm.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, maobibo@loongson.cn, 
	maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, ricarkol@google.com, 
	shahuang@redhat.com, stable@vger.kernel.org, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, zhaotianrui@loongson.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026, James Houghton wrote:
> On Tue, May 5, 2026 at 10:05=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > There are more issues.  kvm->arch.mmu.split_page_cache can be freed by
> > kvm_arch_commit_memory_region(), which holds slots_lock and slots_arch_=
lock,
> > but not mmu_lock.
>=20
> Thanks. I also noticed that kvm->arch.mmu.split_page_cache is
> documented as being protected by kvm->slots_lock; we should be holding
> it here. But we cannot take it here because we are already holding the
> KVM srcu lock.
>=20
> > IMO, the handling of kvm->arch.mmu.split_page_cache should be reworked.=
  I don't
> > entirely get the motivation for aggressively freeing the cache.  The ca=
che will
> > only be filled if KVM actually does eager page splitting, so it's not l=
ike KVM is
> > burning pages for setups that will never use the cache.
> >
> > Maybe I'm underestimating how many pages arm64 needs in the worst case =
scenario?
> > (I can't follow the math, too many macros).  But if KVM is configuring =
the cache
> > with a capacity that's _so_ high that the "wasted" memory is problemati=
c, then we
> > probably should we revisit the capacity and algorithm.  E.g. if KVM is =
splitting
> > from 1GiB =3D> 4KiB in a single pass (I can't tell if KVM does this on =
arm64), then
> > we could break that into a 1GiB =3D> 2MiB =3D> 4KiB sequence.
>=20
> I'm not sure I've fully understood the point you're making, but I
> *think* we can just drop the
>     kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
> line from kvm_uninit_stage2_mmu(). It will get freed when the VM is
> destroyed anyway.

It's not that simple.  KVM arm64 allows userspace to reconfigure the capaci=
ty of
the cache via KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE.  kvm_vm_ioctl_enable_cap(=
)
currently allows userspace to do that so long as there are no memslots.
__kvm_mmu_topup_memory_cache() will (rightly) yell and fail if it's called =
with
the "wrong" capacity, so we'd need to sort that out.

The other issue is that it's not clear to me what happens for large "chunk"=
 sizes.
If KVM is splitting from 1GiB (or whatever huge-hugepage sizes are supporte=
d on
arm64) all the way to 4KiB, e.g. to optimize against break-before-make, the=
n the
capacity of the cache could be significant, e.g. MiB of memory or worse.  M=
y read
of things is that purging the cache when dirty logging is disabled is a gua=
rd
against consuming too much memory when the chunk size is large.
