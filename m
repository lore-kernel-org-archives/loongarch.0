Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127EE3C0C
	for <loongarch@lists.linux.dev>; Tue, 28 Oct 2025 00:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761611386; cv=none; b=RjsC5x44DkDa4BFVMxbzUo2187z7JXf3MdymyL4rRSvwPhA4D04AfB+Tg5qi6iyr/RShu953ct5GNWuyirKZfmktE2gEOqx4V+OKqep8sWAbo6TZmyScHkZjC0FEVAemoMBO2RvT2WbgM3NVyFMnQ+sASw7Km7xoVX3kktd7L1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761611386; c=relaxed/simple;
	bh=qyo5vYPBXQcSiICdjzpbw4YoCeaDaAVfCf6SQjhOYiM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W+RIihrgKV5KASddBVrEkzFMy2alL8WFTJObD9IxCczEON42VBL5tWvMMkLrAL9KHgDs57NJAuubTpDlKiiIxa7QETXDzQyg2lHUveX20ZsPc4KY9gK8bnARtPorKkTAAmi/4C/dFxMc1v0vYx/sohtCIKgMN4XOkemEoA/Ns/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ItOS988E; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ItOS988E"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b57cf8dba28so3934197a12.1
        for <loongarch@lists.linux.dev>; Mon, 27 Oct 2025 17:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761611384; x=1762216184; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fZq3tbinLN9iV6tR9wh+L1TcJJLRbds3pWQbE4SVPQ=;
        b=ItOS988Eyy5FQEAEIKgERADi2ctK2M6Zn7iRYVK+5rpuzUVcpteufnhreQL0EoQqhx
         swAvPJ1N4Na1uAswSaSPKDbWxybh1w5clrHRitXdakBsm89n36+Bjxaei4ToW90YbCs2
         O7GT0nNxvsvsOGdHdqrYIPW6/JPNiNHNLVxkMTLgX+ejqJCZE+JoZlSQRbbvcEub0s97
         FSSHAzKBCz+B4UYhrRO0+h+5oRcl9UCMvFQPCNV638259/ESpskaFWRIM9ftrUNFUxdI
         EucP8w81eQnVjSL4vr1MWonxS/5sQI1NU0XU0UdAnbH52YTadfe/ZC1YCrXbBDr5/d7e
         dvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611384; x=1762216184;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3fZq3tbinLN9iV6tR9wh+L1TcJJLRbds3pWQbE4SVPQ=;
        b=OcKTtJ+HxsCz92pHbkh3NVFAxS509uCQ9QcSIvt+0NrrLuIeql1cYWliib/7kzKIcZ
         UEQVH0Dhp+hvmQQH3hoJ+vHa71zVLEaCx+kglW6Gh68EpH9rZ6f8wmGYTlq+tO5gHpR6
         GFbCI15O63VxqjGkBbFByp5WWVCG9Bu9UOaI0PcczSS/a17MAteexqLrVa1rbmgu2Sr5
         bgMLwnpbdqXpGwuk3w9r69v1LK59DLd40KSsmP/CyJotsoUUgMvTprIgmY89suba53i0
         JVIvzbA/FJmfbiEAGcwfar+yYY/tIQPRpwMVLYQyrp4KufHL4D8Hz35/6aQRRbUXMfad
         EpnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk6T/omcykx70rvAjwwXB+hUY4co9wHFel/eppWj5b2YYD3Z7h705jEbRu9pCU5O3q04sUaPTWqD0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+gu+LqvFa19Usgs1nhkjNiuDVZmbsIXVZ1RvBsmnEBwm7/7Jz
	G1FnzbQrHsRCmIhtM4jn9uSuLxP71Hil96JMY+/o6CKj9GblHLSNxr57trpbBvgHWfn0cs39Ftq
	NN8USrg==
X-Google-Smtp-Source: AGHT+IEcbPffJX+DPzKHtANj5YoID2qTNS+wCvJIhOFTengBDdmvUTitjaF5SaOhKDAJ4Iu3BAJZiOrVVlg=
X-Received: from pjqc14.prod.google.com ([2002:a17:90a:a60e:b0:33b:51fe:1a77])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d0f:b0:33e:30e8:81cb
 with SMTP id 98e67ed59e1d1-34027a0775bmr1898674a91.13.1761611384405; Mon, 27
 Oct 2025 17:29:44 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:29:42 -0700
In-Reply-To: <59ae9957-88a8-4777-9bd2-196e8b4eb8ac@linux.intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com> <aPuqYz3ly5a3__mf@google.com>
 <59ae9957-88a8-4777-9bd2-196e8b4eb8ac@linux.intel.com>
Message-ID: <aQAOdiSUktmAJKsw@google.com>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025, Binbin Wu wrote:
>=20
>=20
> On 10/25/2025 12:33 AM, Sean Christopherson wrote:
> > On Fri, Oct 24, 2025, Binbin Wu wrote:
> > >=20
> > > On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> > > > Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spt=
e() as
> > > > providing a one-off helper for effectively three lines of code is a=
t best a
> > > > wash, and splitting the code makes the comment for smp_rmb()  _extr=
emely_
> > > > confusing as the comment talks about reading kvm->arch.pre_fault_al=
lowed
> > > > before kvm_tdx->state, but the immediately visible code does the ex=
act
> > > > opposite.
> > > >=20
> > > > Opportunistically rewrite the comments to more explicitly explain w=
ho is
> > > > checking what, as well as _why_ the ordering matters.
> > > >=20
> > > > No functional change intended.
> > > >=20
> > > > Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> > > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> > >=20
> > > One nit below.
> > >=20
> > > [...]
> > > > +	/*
> > > > +	 * If the TD isn't finalized/runnable, then userspace is initiali=
zing
> > > > +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the numbe=
r of
> > > > +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.=
ADD.
> > > > +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pa=
ges
> > >  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^
> > >  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Nit: Is pre-mapped better?
> > Yeah, updated (and then it gets deleted a few commits later :-) ).
> Oh, right, nr_premapped will be dropped later.
>=20
> Since the whole nr_premapped will be dropped, do we still need a cleanup =
patch
> like patch 12 which will be dropped finally?

We don't strictly "need" the cleanups, but IMO intermediate cleanups are of=
ten
worth doing even if they get thrown away, soo that the code is in a (hopefu=
lly)
better state when the "big" functional change comes along.  I.e. if code 'X=
' is
easier to understand than code 'Y', then theoretically/hopefully X=3D>Z is =
also
easier to understand than Y=3D>Z.
