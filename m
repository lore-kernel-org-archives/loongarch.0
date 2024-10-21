Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F531F9A8F
	for <loongarch@lists.linux.dev>; Mon, 21 Oct 2024 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729534392; cv=none; b=Mjp0uQrhLzjOSKd+XEidI3d+7DTzbCAaKeKHmULWbZRNb2GNCkpBYo6vTVb1icnA1A8fxQTl0j4O7N0ZskwsmGz7No3N2NN22II5457/KyX2TiIDNuyXT7M6ab18pP9ut1Uk7/Rz6lKYcyJ4wl4Y27yITjYdjfNt2oyub4VuKQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729534392; c=relaxed/simple;
	bh=YeXYNnt8ENmKuB15YwhakNFnDdgCdBZF4Bj1D5TS0z8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M/OGpwl1LKLbZbfWj8OO3COQJ+D1Jtm87k7RjVT7uig/0J1tNpXCKyCgI6ERiqsa1bWI0MxKA9fiGt+Z/DB3iqmXn8eNeI33teoFkT6opwRWx1sqKyfd5oAMomLb4zdqDrG2qGKwa3m859Z5eoo/K5eSDteRc4mW/4OBOtbzKSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=joBsGhEb; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="joBsGhEb"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e28ef71f0d8so8891519276.0
        for <loongarch@lists.linux.dev>; Mon, 21 Oct 2024 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729534390; x=1730139190; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aTJKIPGdXYIQ4z1/mPhLVqGYb++KmSjcoFUbuTd6EE=;
        b=joBsGhEbso4disLN0jA9bcEDtjn0o39o8CEEVEPU7YP74AP3fzYWsnUytRX2CzOdgo
         /sfEjcSnbmIS5CgRS9bR0yBpYriNbysNp/z+GbtMfFHCT1pydmyL0CGljaSmPdy0tVR6
         eR/2pMYS+pZGiVB6npeLtAxr0MlqboQz7cCiTkuKER4dLLa4DOIy6g7o3KGPNdYmj/v9
         NKNOIQ5nN5nw6zu+wI5jPlUI1z7tw/1yMu7WVwMc/ooW8q5h/qRTxZmvdlvxTTUYPSD8
         ypMwyqg+BDbadvS8C/o10BQFT9L831CN8AvUiGCwDNgygKfPu/EAvCGUPD2VMpDNhvMX
         L86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729534390; x=1730139190;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/aTJKIPGdXYIQ4z1/mPhLVqGYb++KmSjcoFUbuTd6EE=;
        b=sVQZvUzDm55l29RWwHv0RQAPVp7OcwYyzfsXyx2udRtPLFaV/hiXiC+jYpbwPyjKpL
         UTq+3xZlIVjPADFDE6QC7RsotHMYyPR/NX34n/VhWnZzd9VHR4Nus0MAOPabixoAeLgM
         kjkjHVWhov7LGAD2nSaQZYtxNaRQKp3NnPAMz49i+6m54C+AoIel4lC34ONan6jibkxh
         26BTtMjrmtZ6e+LlyO8XWyheQ3TZmEWa5E0KDjpwdgt519SstEoSbir+3q7ruCNW9WO8
         3hdE0ngok5G4bR6N6LkNXUAoFnTHnUyPAzBUyH8VkoG5lzj11QpjEUxt1v8TQtx6oNSM
         Q/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXLmWmXcjFVb1d2m20h4P5u3pLn10fQMA3HWj+vzhkhcesO1NMM+HbacNXiIMRVNQg6YPEzbUwRgqA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3Rs5IAr7rmtPOKxFU0LFAseu8iGyyfBWSKlbqc8NQXCpEJrmu
	QeQbvq6iuurp+aBTO5UaPHIhhmoc0OS8CTpv6aygICKOmbpnETZklrYZ4nNLP+G+HuZl8QtCsAB
	cEQ==
X-Google-Smtp-Source: AGHT+IGB051RPG0qZ1hHpRMmy9gqDX/0GH7so+xa+rGGnhbzxuPrj+6CH4debSRqPENvRC2d7Upq2p/funE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:8389:0:b0:e2b:e955:d58a with SMTP id
 3f1490d57ef6-e2be955d949mr2592276.7.1729534389536; Mon, 21 Oct 2024 11:13:09
 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:13:08 -0700
In-Reply-To: <ZxYeFKl2KbZ3Ila1@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <20241010182427.1434605-35-seanjc@google.com>
 <ZxYeFKl2KbZ3Ila1@yzhao56-desk.sh.intel.com>
Message-ID: <ZxaZtJGfN2_5Db6h@google.com>
Subject: Re: [PATCH v13 34/85] KVM: Get writable mapping for __kvm_vcpu_map()
 only when necessary
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024, Yan Zhao wrote:
> On Thu, Oct 10, 2024 at 11:23:36AM -0700, Sean Christopherson wrote:
> > When creating a memory map for read, don't request a writable pfn from =
the
> > primary MMU.  While creating read-only mappings can be theoretically sl=
ower,
> > as they don't play nice with fast GUP due to the need to break CoW befo=
re
> > mapping the underlying PFN, practically speaking, creating a mapping is=
n't
> > a super hot path, and getting a writable mapping for reading is weird a=
nd
> > confusing.
> >=20
> > Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  virt/kvm/kvm_main.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 080740f65061..b845e9252633 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -3122,7 +3122,7 @@ int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t g=
fn, struct kvm_host_map *map,
> >  	struct kvm_follow_pfn kfp =3D {
> >  		.slot =3D gfn_to_memslot(vcpu->kvm, gfn),
> >  		.gfn =3D gfn,
> > -		.flags =3D FOLL_WRITE,
> > +		.flags =3D writable ? FOLL_WRITE : 0,
> >  		.refcounted_page =3D &map->pinned_page,
> >  		.pin =3D true,
> >  	};
> When writable is false, could we set ".pin =3D false," ?

Hmm, maybe?  I can't imagine anything would actually break, but unless FOLL=
_PIN
implies writing, my preference would still be to pin the page so that KVM a=
lways
pins when accessing the actual data of a page.

> Also not sure if ".map_writable =3D NULL" is missing.

Doh, my previous response was slightly wrong, it's implicitly initialized t=
o NULL,
not false.  I forgot map_writable is a pointer to a bool.
