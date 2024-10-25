Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA6E20C33C
	for <loongarch@lists.linux.dev>; Fri, 25 Oct 2024 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729878123; cv=none; b=QQwMmz24I6vcPX/NG/csDKn2QBKadGc3SGFVbYOQ9FIvZ94Rhbh2LqhsSrL+MzU7ikQCOeFXZrLCAvKAyiqAQee6EpRAsgCHO9AJBxbGacfbW3qdjJuFEirSIrmSJ+z8qz1cci4Po8GVyQ8MO4gIQl453zVBuNzgTr1AVvjVCYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729878123; c=relaxed/simple;
	bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+zsvzckxD0wkVJgxJWJSHH1eKLE+U48GfKDcsBIlqKh6yLzkqppBWySywJ9pRrwYw9gTwhip1qbz5mDCGyTPdaJjXTJoWqSJpXXx0/mDitz1/VOHV0RFqng86uMrjUA1QdITXZdkkqEUY0rXstsSXljzcz2CC7sYvpsCbF3orI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DUR/GHB/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DUR/GHB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729878120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
	b=DUR/GHB/zU+ENd7g+McH4suIHL5pOTJGuRu8QKQ+h7Un9UEoPuSk+jqrywXWwjDZJhA/no
	Um3Mj0+A1d7YMQc4ernvQv0RlT4B0xiOSx7Z5Cskx3DQrVpX63ono7Bk7UxENws7HH3N8Q
	wBz/grDCW1W+wVtmTOOo5d2LS5a1Hio=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-UUe3SvryMROKZFeRR7Aulw-1; Fri, 25 Oct 2024 13:41:59 -0400
X-MC-Unique: UUe3SvryMROKZFeRR7Aulw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d59ad50f3so1173442f8f.0
        for <loongarch@lists.linux.dev>; Fri, 25 Oct 2024 10:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729878118; x=1730482918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
        b=fWqlA5M5r960VkMvfW9STcWrYtoPLLK5bdrGSVg9/TnjVFjNsJzHjkgMr8WdJdbyw6
         xas5iIffQpBWx97RXLnmQguLyRxrRpzdiA4wlfsSCbGVd6dIDuIEA0hrip9/rF+NIB1a
         u+TaG/IIRNx8QGSvaa2Jymscq3v7eDaWs1OFfd6PobBisuy2RQrEWrajeX+gT8B+LZJr
         ZTsqqzc7NVEeouMP0Hobr3A1wk9UdcinuPAcR5kG/Mz3GUBMOrnmBm42lsM6sOCEwtUz
         0v8oDu/E4khNZiUwGtDr+7FNpDWtNm5L4OOOp7kuCBksgHqytgnrOO2Nxzfrgdt82/eb
         5CIg==
X-Forwarded-Encrypted: i=1; AJvYcCVwZX/2+CIRUBr+2ZgmWTtIoz/YMx24IkcXQ0din3IPtL0LH4Qc3yDsOSpQFfYTKm/qS7UBj45ohqU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn/pKhhL8ewezT1M1qjWsI/ZSIEUYxk+bgVVD1vZ3YFO8sOy9E
	/iAKy1gmgd4v8ZFAfeyu5w1G4JQdV4e9iAByUoq4WDXKQJ/dH+J5FC4ZHPHTQHiTUvCnxjRUNZB
	/A2gKDOMbrcYbcAX+HfUlv/3XBSWbgnlI5u8nsJ4Hh0OuD18z/0hC/lgsncjqUqhJ4b7L2BJQrT
	JzrjDEoVH/tQ0aroP/hhLHS+QPUvqUGpwR
X-Received: by 2002:a5d:410d:0:b0:37d:5436:49b with SMTP id ffacd0b85a97d-3806113a07emr163678f8f.13.1729878118155;
        Fri, 25 Oct 2024 10:41:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJirsSaLOjUEz6kn7HmxOjIyhE9ZfBrB9GAGHgNcgNSBUFOeNbcRoyDDrANp8n6mxM4gCIddwEWDqpYot15qQ=
X-Received: by 2002:a5d:410d:0:b0:37d:5436:49b with SMTP id
 ffacd0b85a97d-3806113a07emr163639f8f.13.1729878117761; Fri, 25 Oct 2024
 10:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
 <Zxbw9XcFCHYR1Ald@google.com>
In-Reply-To: <Zxbw9XcFCHYR1Ald@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 25 Oct 2024 19:41:45 +0200
Message-ID: <CABgObfayH1x3qFjOiM=rQjxiui5tXJXObgR_qOGV5Hn_2QLEJQ@mail.gmail.com>
Subject: Re: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Yan Zhao <yan.y.zhao@intel.com>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 2:25=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
> > Looks good to me, thanks and congratulations!! Should we merge it in
> > kvm/next asap?
>
> That has my vote, though I'm obvious extremely biased :-)

Your wish is my command... Merged.

Paolo

