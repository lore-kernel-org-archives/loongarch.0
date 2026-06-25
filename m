Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728AC305693
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411147; cv=none; b=YwRRi8x54LVph3QWeucPejKTjrAu5VjgoVVYcy3O1zcUd3Oq3z2xutWnu4USp+KnGOruBpyUyNFvqL32k9BSa5DH1qOHJrye0LLI5ndLx61DHSrviDMI6JZ6jYLk2Ct2zu1buoYBW68asw+EzSZJZNcg8u0jn/oZyBtV3jxUSY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411147; c=relaxed/simple;
	bh=1mmqybtyyz3V7YDYArUGJdTCwOdw8wCbGqaGSAkZixQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J8DzhnOD8Uhr7BMC433292v5KDUqW4Z+0Z88aeZ0sCHAdmwLTSOu8BqeYToZzA7vRx/t1F6fpsRD/SWS0JpiVHjnn9yDtV8P7NAVwulBT9YP5/msAjiBrLOCs39WzseSue5Zhi8THUIHhenp1mZbFRaGuZ3ly/e4YLAOGraI/gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fHH33G+f; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fHH33G+f"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c8018f11fbso1557285ad.3
        for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 11:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411146; x=1783015946; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mmqybtyyz3V7YDYArUGJdTCwOdw8wCbGqaGSAkZixQ=;
        b=fHH33G+f+Ck58QS+iQfleVXN7qa9tgveGbAqSMLrZe8EZsk4irubBcc7vHwlsRsOWc
         nKXrrZ31v/dsFEN+uEVo+AG6EtG2x/n5BctvY3cWEqpnnqQldmaoVyQ0zBPdr3tpk1IK
         W9gYKdG9svPGIgfNLw5TcuXfLWGjM6j5Zb1vdQ9cAuONuQdkIz6dK5JDRPckeWrDXBXP
         ur2/Ln1vMPGkZ9PxNHHyfr6hK647/vD4vapw4+6LlgJp07ZQRjbN6ZfgFVO3GzEw0fZz
         61BzsUL8ICOGmcRIfr4008fgKi0/4W5eUzapKkJtCIspnnwZHKs2BpO3wl61HbHT4e6c
         3R8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411146; x=1783015946;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mmqybtyyz3V7YDYArUGJdTCwOdw8wCbGqaGSAkZixQ=;
        b=Yg7Lp0tozWswR1fFTCrjLnsLQoxzjkN36GQ5GAnMtvN/QhdMVDS4LEGk5T47H9sTD6
         TQym5Ecriu257ExVmoaizlb7+RuArCl0MeTgRGSbKMzc2I5TNuYXGMSsATZdR+IUSSRu
         rZsme3SMn20sf9xmTTsVBez6rhnvEqZ/GJSUOTiLD1ukuFBwnbQ0c01OkjXro+36yrBu
         zrnHuVbBFOnvbFjC/kqUKn0f1pb5DVcHY7eVe6yTQ44cyQs253W4LyfCGGmT5DbOXMyo
         rowGEAadoirxUThzF8P8UT64ThaqZSUqjT6FIH5lUYEOZFluLcnCUChPpcO11YD3SFcO
         YyIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3msO05bPRelG4WgE8cTmgDVX305YHE9jWwPW8AijE64Gb1rRi67pIyNXUGpDFtuFmT2BUgvNDH1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFmEtIH3c1H25mhOKK/JJVhBKP+Gnnywc0mhWs2/nDEi+o1SFG
	ye31NOcUgeMAjQ+VinfC5ltj+f9yzuM6vvpNNrP3C7dbticnFEQCKPByJNtiriI6roDV46uPrUp
	zL3DEJg==
X-Received: from plsd11.prod.google.com ([2002:a17:902:b70b:b0:2bf:195a:2b9d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a86:b0:2c2:dadd:940
 with SMTP id d9443c01a7336-2c7fc75a039mr38047275ad.2.1782411145490; Thu, 25
 Jun 2026 11:12:25 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:12:24 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-3-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-3-4fe8b602ff47@google.com>
Message-ID: <aj1viF0luJZ0bskh@google.com>
Subject: Re: [PATCH RFC 03/12] Documentation: KVM: Consolidate notes about
 kvm->slots_lock and irq_lock
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, vannapurve@google.com, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, May 27, 2026, Ackerley Tng wrote:
> Move the detail about ordering between kvm->slots_lock and kvm->irq_lock to
> where the two locks are first mentioned.

Why?
