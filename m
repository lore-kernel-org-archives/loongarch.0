Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA1B79E15
	for <loongarch@lists.linux.dev>; Wed, 13 Dec 2023 23:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lQryytS/"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5e283ef6299so671297b3.1
        for <loongarch@lists.linux.dev>; Wed, 13 Dec 2023 15:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702511791; x=1703116591; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxO4lwP1Y614pYP6ZHT+U53NlXgl8rz0sajx/aIIUBo=;
        b=lQryytS/8JU4PqG3zEQi2X+LWZe5ClZFwmSuYK2J+3FUV5vmYb/epIPVHl7tqm4JaY
         sLMV/ulvQGeZ155UazHSdmpElC2ZPLmMo8yFlOHMVzUvt7ta+npEw4eDuTKmoWDsIQez
         jleJqCyUDJzmtRTu9I+BjCXH8Kp/q7SRZgs4DPDhDajocf5Vo+sL750OdlMl3nOK/TO5
         kZS/TJMNbDnG4UykyxPnvBuqWaCX5h+30H5KuBcuxcGH4ksFPplK5ybT34EMHQsiILW7
         zxKT4L4tX2KhNzKR4kpvQw+IrN35aFG8IuFYssMreg6RU9WfEnc0bW1Gi6imWFh1Uk5h
         CG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702511791; x=1703116591;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UxO4lwP1Y614pYP6ZHT+U53NlXgl8rz0sajx/aIIUBo=;
        b=GkxHvZv6DaT9AHUel5e2RZeg7HcEBqtLJT1I82YpDeYjqdCUFEF1jxoAVx7Tq+DEJ+
         xdZ9giDCmqZ+My41p44jWSGQRnD4hT0Iy+FGetXBNYCWUd+lioxsaNGX4sKf/6TqyQSD
         98CIw4fjVKUiE0/ZgQ6UpRR3kQRKlRP7QSVtA8onUprBjQNYN+UWLOePlk0z2HOIts59
         V3iS1mAWCA7qZ0VMX8MQyhS5UehtbsuuAJUxBlFdn5xrRGH0JAFx4hyEJ2hGKZlDJfaI
         J/HTEtAve2TOg1GbTpm3+8+0aMW2SnqZNdFxBAC0PCu496A2FQQ0uCJllqf+1lhvsRdz
         r8KQ==
X-Gm-Message-State: AOJu0YzmYOs37o1hS/MXpBXpyUDAaRLf7l865Awm3hKmT+ZYGeNUIByz
	OsvPgjpBSlYnwV9QjvzOgZFebVz2Mfk=
X-Google-Smtp-Source: AGHT+IEdEJxURty77JppqMbnEcTtdqehWo1GpHD5Zc7eekAL54I1TN5IQJjkH6fjT6U+/8piBXb3dgq1kJ0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:14d:b0:db5:3aaf:5207 with SMTP id
 p13-20020a056902014d00b00db53aaf5207mr151250ybh.3.1702511791190; Wed, 13 Dec
 2023 15:56:31 -0800 (PST)
Date: Wed, 13 Dec 2023 15:56:29 -0800
In-Reply-To: <06076290-4efb-5d71-74eb-396d325447e0@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231130111804.2227570-1-zhaotianrui@loongson.cn>
 <20231130111804.2227570-2-zhaotianrui@loongson.cn> <e40d3884-bf39-8286-627f-e0ce7dacfcbe@loongson.cn>
 <ZXiV1rMrXY0hNgvZ@google.com> <023b6f8f-301b-a6d0-448b-09a602ba1141@loongson.cn>
 <06076290-4efb-5d71-74eb-396d325447e0@loongson.cn>
Message-ID: <ZXpErTHBn6HeQUOp@google.com>
Subject: Re: [PATCH v5 1/4] KVM: selftests: Add KVM selftests header files for LoongArch
From: Sean Christopherson <seanjc@google.com>
To: maobibo <maobibo@loongson.cn>
Cc: zhaotianrui <zhaotianrui@loongson.cn>, Shuah Khan <shuah@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, Peter Xu <peterx@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, huangpei@loongson.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023, maobibo wrote:
>=20
> On 2023/12/13 =E4=B8=8B=E5=8D=883:15, zhaotianrui wrote:
> >=20
> > =E5=9C=A8 2023/12/13 =E4=B8=8A=E5=8D=881:18, Sean Christopherson =E5=86=
=99=E9=81=93:
> > > On Tue, Dec 12, 2023, zhaotianrui wrote:
> > > > Hi, Sean:
> > > >=20
> > > > I want to change the definition of=C2=A0 DEFAULT_GUEST_TEST_MEM in =
the common
> > > > file "memstress.h", like this:
> > > >=20
> > > > =C2=A0 /* Default guest test virtual memory offset */
> > > > +#ifndef DEFAULT_GUEST_TEST_MEM
> > > > =C2=A0 #define DEFAULT_GUEST_TEST_MEM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0xc0000000
> > > > +#endif
> > > >=20
> > > > As this address should be re-defined in LoongArch headers.
> > >=20
> > > Why?=C2=A0 E.g. is 0xc0000000 unconditionally reserved, not guarantee=
d to
> > > be valid,
> > > something else?
> > >=20
> > > > So, do you have any suggesstion?
> > >=20
> > > Hmm, I think ideally kvm_util_base.h would define a range of memory t=
hat
> > > can be used by tests for arbitrary data.=C2=A0 Multiple tests use 0xc=
0000000,
> > > which is not entirely arbitrary, i.e. it doesn't _need_ to be 0xc0000=
000,
> > > but 0xc0000000 is convenient because it's 32-bit addressable and does=
n't
> > > overlap reserved areas in other architectures.
> In general text entry address of user application on x86/arm64 Linux
> is 0x200000, however on LoongArch system text entry address is strange, i=
ts
> value 0x120000000.
>=20
> When DEFAULT_GUEST_TEST_MEM is defined as 0xc0000000, there is limitation
> for guest memory size, it cannot exceed 0x120000000 - 0xc000000 =3D 1.5G
> bytes, else there will be conflict. However there is no such issue on
> x86/arm64, since 0xc0000000 is above text entry address 0x200000.

Ugh, I spent a good 30 minutes trying to figure out how any of this works o=
n x86
before I realized DEFAULT_GUEST_TEST_MEM is used for the guest _virtual_ ad=
dress
space.

I was thinking we were talking about guest _physical_ address, hence my com=
ments
about it being 32-bit addressable and not overlappin reserved areas.  E.g. =
on x86,
anything remotely resembling a real system has regular memory, a.k.a. DRAM,=
 split
between low memory (below the 32-bit boundary, i.e. below 4GiB) and high me=
mory
(from 4GiB to the max legal physical address).  Addresses above "top of low=
er
usable DRAM" (TOLUD) are reserved (again, in a "real" system) for things li=
ke
PCI, local APIC, I/O APIC, and the _architecturally_ defined RESET vector.

I couldn't figure out how x86 worked, because KVM creates an KVM-internal m=
emslot
at address 0xfee00000.  And then I realized the test creates memslots at co=
mpletely
different GPAs, and DEFAULT_GUEST_TEST_MEM is used only as super arbitrary
guest virtual address.

*sigh*

Anyways...

> The LoongArch link scripts actually is strange, it brings out some
> compatible issues such dpdk/kvm selftest when user applications
> want fixed virtual address space.

Can you elaborate on compatiblity issues?  I don't see the connection betwe=
en
DPDK and KVM selftests.

> So here DEFAULT_GUEST_TEST_MEM is defined as 0x130000000 separately, mayb=
e
> 0x140000000 is better since it is 1G super-page aligned for 4K page size.

I would strongly prefer we carve out a virtual address range that *all* tes=
ts
can safely use for test-specific code and data.  E.g. if/when we add usersp=
ace
support to selftests, I like the idea of having dedicated address spaces fo=
r
kernel vs. user[*].

Maybe we can march in that generally direction and define test's virtual ad=
dress
range to be in kernel space, i.e. the high half.  I assume/hope that would =
play
nice with all architectures' entry points?

[*] https://lore.kernel.org/all/20231102155111.28821-1-guang.zeng@intel.com
