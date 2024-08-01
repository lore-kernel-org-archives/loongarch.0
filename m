Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E13216EC12
	for <loongarch@lists.linux.dev>; Thu,  1 Aug 2024 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722504067; cv=none; b=Kdk+K5elbwUH9SxpPB0UGjzlAnH0IjUsN7PLIGz8Afue1Sg+3BLJnB9sUOMgtPNDShCVbHObrofp/b/oTapUzT1OYR8f17dX2ILmO5lDMVhY4pYz7tEaHRhrPZpa2MSqVG9QeQVjnCt0IDG9dOYQ5d/iXwoVhqQ/UeMW3KMdcAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722504067; c=relaxed/simple;
	bh=3Io79nUQn8ypd8PwwL4q+T1yD0diA5Tfaz6TUlMiA8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nC6WOyU/W/mrjcsNHKt8nb/80pW/wBvhe3Z6MiSVeeJGu2277UfiaL9G1D7fmPH6ssaKFVrn+DvTMKOK3UXZEESo2VDoG9neZS7DXqGO8MtZSSUNwQqvyd2aEIzPgR+KcSTIAq6aKGTh8IJoiP9UjBmAbJRifW/yHS/LUuAg0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k+hRirx7; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k+hRirx7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso9605656a12.1
        for <loongarch@lists.linux.dev>; Thu, 01 Aug 2024 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722504063; x=1723108863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQVA9z2jkUPxM3dqZI0KDPVXgKoffaizeXmufcNkJbk=;
        b=k+hRirx75p63pZ1NcxRnMLXTMbwGjy1m7Ea9y6KsJ4sKKV6X0cmhKpxd0HZDWF43jt
         G+MspIogmsECHInIvzsax+2UTDAtN5caG/PDnJXf2otirYmFqxqjQSLs550AA2/Ow3oD
         vwLHgZnZNxwgVOHPtNF4+r0EPerbl1OEQDMETProkfRdtYluL/sxY2dCkbnu4OFEpvXA
         vJg+MTAADM0NLtNEms0davGk7rOj5STjHp8Dok0RQl0CABf9OXMaHC7raO/0UNPUmfq2
         eczkUrW5K+3XftQNLH/apXxBwzKKFw7/f/LHYz1FNA95y0/uEDIrSyCVI/XBfmfVAItc
         Mg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722504063; x=1723108863;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQVA9z2jkUPxM3dqZI0KDPVXgKoffaizeXmufcNkJbk=;
        b=VyHcex1u7BWA6J9ggIHABUhVBfhaGAyg3FBvaPaBY5sSRrCvVAp6U1Rn3O58syQZcA
         Cdbvf12wjolfqTkI4Zsg7D5ia1NQg2zfJpsJPuNgzlH2zA2L+BNh3Luvyq32f+t/V0E1
         qZZnlbugg7X06oF0kTs5tO+Nxlr7y+sMSrzH4DLzNKORZHQiMFcgrE0rCJtYMXbLEMiP
         GOdsrMZPqkYHn6NUx26/Y5tRtvdqJJPZnPbUntk43xK6epz1Z5E8V3fC0FrPh0AR/ci8
         GF6HCRB7iXESEacND2AXzj0D7o3GNicdfyOIB55IQq1jG7/AWtxLH47Tni8cpsQ1jbYa
         4s/g==
X-Forwarded-Encrypted: i=1; AJvYcCVKrlOT5EHXyXwli5LO2rU0GHA7olE49/es0ZxlxtWYLmzp28bA/3bHE9tl034IxWuuCp4OnVVbU52FfsYIkPB9tCsIcAAvJc32
X-Gm-Message-State: AOJu0Yx5DSlEG1a2OFz41d47holwJHxnNZD+x2xsBaN6r65EG5jY9YZr
	UqK+Oo52vltODIeG2lKkUuSKBl2RRDB5xZeislhGu/Wcs1cKcjelz8W1Cy7vCMo=
X-Google-Smtp-Source: AGHT+IG4an2mFFKr4wz3Z9DFgeOmmND21A8Rbh3YvwoLKrs/2dCx443xl5h3j8lRXM2FS1yhxPSg2w==
X-Received: by 2002:a50:ee82:0:b0:5a3:3062:36d6 with SMTP id 4fb4d7f45d1cf-5b6fe72ddc6mr1090738a12.1.1722504062925;
        Thu, 01 Aug 2024 02:21:02 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b017787967sm7857844a12.9.2024.08.01.02.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:21:01 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 51C785F80C;
	Thu,  1 Aug 2024 10:20:59 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 05/84] KVM: Add kvm_release_page_unused() API to put
 pages that KVM never consumes
In-Reply-To: <20240726235234.228822-6-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:14 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-6-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:20:59 +0100
Message-ID: <87wml0egzo.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Add an API to release an unused page, i.e. to put a page without marking
> it accessed or dirty.  The API will be used when KVM faults-in a page but
> bails before installing the guest mapping (and other similar flows).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  include/linux/kvm_host.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3d9617d1de41..c5d39a337aa3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1201,6 +1201,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn=
_t gfn, bool *writable);
>  unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn=
);
>  unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_=
t gfn,
>  				      bool *writable);
> +
> +static inline void kvm_release_page_unused(struct page *page)
> +{
> +	if (!page)
> +		return;
> +
> +	put_page(page);
> +}

I guess it's unfamiliarity with the mm layout but I was trying to find
where the get_pages come from to see the full pattern of allocate and
return. I guess somewhere in the depths of hva_to_pfn() from
hva_to_pfn_retry()? I think the indirection of the page walking confuses
me ;-)

Anyway the API seems reasonable enough given the other kvm_release_
functions.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
