Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02A818FC6E
	for <loongarch@lists.linux.dev>; Thu,  8 Aug 2024 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130303; cv=none; b=OCNbUUBjnIZsseIKZWbkD1uO27H96OXSR1ES9DRpP4QwJVkLzaKBBpQAS9h/Lb10wWLxYgTEHT+HmRT8Mo1sQbO3ND5g5Ctkv+B3NQrQi9JgawaPtbpqp3G2TvW72M+iAxxC0UrPUxGb4FrJu1B8gEekuiTjPxZQosjyxePvODY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130303; c=relaxed/simple;
	bh=JIv1oe8oudJUiS44KwPc6LaXFpIpf2hHYtHrt3Gk7Fs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=anx+7ihgU4dlJBnS3GKKQUiH/keCmCS2LAImU7MfWqVfbbL10DFyN8kQ60qXxD+AENezXTjswmHmGWUpqMT6KZduB6IkhHXXNU7f7ytg59M+zlade4uK8JDZK2x2oTX/7rnENDGVWsJu/vlglA3b9wAf6ySLxW3lsXYwi5J3960=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IpylZV/j; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IpylZV/j"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42812945633so8333255e9.0
        for <loongarch@lists.linux.dev>; Thu, 08 Aug 2024 08:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723130300; x=1723735100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tobJ9z30Evl1jF8OZuU4Lc5uAJoWjkGhLZnI88VCnqo=;
        b=IpylZV/jbeFloUMJ8p4AzhqGfwrUM9Nc8387VAWtk1Mg1CadXPWcIPQqCXE+yUJ2hv
         9TLS0IQb0wY9tiDkLUfN4uvlmaFWvzNB9FlvpBhKQ4YKw25SUaNVPjaAqL394UM/3oyX
         CpAlMqX0tKjZkn1upshNAt/O8blshQR79ejhv6VhwyLvDdAyGZttgHrADelA/9haBqkg
         7N1dKxnYeRogEIU2aji7dbZ7yo0BXUGme9jXPG2Eq6lJDXFG5fULn+Ha5F9NpM+r9pHH
         XdkwRLiLfCf6fk2kOsVPwPOkYAKMYVv8ENPibE0FRJhCCyly/wJNUy9CK3+m90oYmfGO
         LZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723130300; x=1723735100;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tobJ9z30Evl1jF8OZuU4Lc5uAJoWjkGhLZnI88VCnqo=;
        b=Kt/8qjYuDH8/R5oK2gkOPzFt0OexY/NvOHWPkRGC4Y5ibCwF22zEwrnVk5Mt5K8gsF
         EIGUlTB9LT8M6sKv5cQCg8yFtbZR3suA/TH5/xuU3WoL5ohmyASVp2qL4P2Du6Pno5+N
         OJXGeSKkpsv+M3T1x7lez4jD1UnCOdbjBtizSrhFqp+hqzWoSSxQ9LnL2s7wh6yEvxet
         4HZ3lVBFeS0Iv5aYYyXUgKWtsb67e9KJ8jal6jabg9h9n4Yo8WwCp4ckx1AFTy+aR4mA
         9C8a7Kiiw7sOcpFcFhgoTBF8Ti5Mo7hMFmM2F99TcR4Uu2yFblSeFBcXlS7yoI61SqWZ
         EigQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTYoDegxB3souRxjD5UpOgyNiWdON1JC3WOQLu8XtUgXVpn1yQn4eUObIg32gl6F/YpL8tEj6K7yQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoNhlbWvLamtMB4qfQ4iSzFu/xo0fqDqqYwhhdlfViCiLf1PlH
	bKPL/KFyC3fvJYvvi4PTGjjL8o/xcmCqOZt76yTAqXhRs60OY21fqYocD+46B6k=
X-Google-Smtp-Source: AGHT+IGvryFhFZyruwyY4esgEivQLYITNxgcfgoPAmbjFk+Vzw8kMU8OO4VMz6KIvqZ2Rys90VZ6yQ==
X-Received: by 2002:a05:600c:1914:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-4290af13367mr16171145e9.19.1723130299428;
        Thu, 08 Aug 2024 08:18:19 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059a5dbbsm78703665e9.36.2024.08.08.08.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 08:18:18 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BF0C45F769;
	Thu,  8 Aug 2024 16:18:17 +0100 (BST)
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
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
In-Reply-To: <ZrTFPhy0e1fFb9vA@google.com> (Sean Christopherson's message of
	"Thu, 8 Aug 2024 06:16:46 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-14-seanjc@google.com>
	<87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com>
Date: Thu, 08 Aug 2024 16:18:17 +0100
Message-ID: <877ccrqc06.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>=20
>> > Now that hva_to_pfn() no longer supports being called in atomic contex=
t,
>> > move the might_sleep() annotation from hva_to_pfn_slow() to
>> > hva_to_pfn().
>>=20
>> The commentary for hva_to_pfn_fast disagrees.
>>=20
>>   /*
>>    * The fast path to get the writable pfn which will be stored in @pfn,
>>    * true indicates success, otherwise false is returned.  It's also the
>>    * only part that runs if we can in atomic context.
>>    */
>>   static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
>>=20
>> At which point did it loose the ability to run in the atomic context? I
>> couldn't work it out from the commits.
>
> It didn't lose the ability per se (calling hva_to_pfn_fast() in atomic co=
ntext
> would still be functionally ok), rather the previous patch
>
>   KVM: Drop @atomic param from gfn=3D>pfn and hva=3D>pfn APIs
>
> removed support for doing so in order to simplify hva_to_pfn() as a whole.

It still sticks out given the only caller no longer enforces this.=20

How about:

    * true indicates success, otherwise false is returned.  It's also the
    * only part that could run in an atomic context if we wanted to
    * (although no callers expect it to).

?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
