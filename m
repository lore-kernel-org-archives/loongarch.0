Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40CF3DBD6D
	for <loongarch@lists.linux.dev>; Thu,  5 Mar 2026 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731177; cv=none; b=bgxmPI6gzg+uWPtYqbSWg49s/zSqwK8cP5fRd43vu7jiLDRnb1iBH6y50QlhiaaeShCs1EoxWNwOabOUtwQUueES8Bza7ZHJwSENCq+NowKYcrbCD8fkw/PBTZm1zTi8MRIvLanFwG35tI7CNzTS2HgZszwRkdpzFmoJ9QELueU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731177; c=relaxed/simple;
	bh=44DsyPZjR3+ZY9GszCDwqZ3g/HaaKmi7IKLakzXhb6E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u0J7V227nH5Gd6gAG26Dv9W7BecOQ73/9Xypn2ZcFLFmxWgEa8dO6cadbfFfxy+7BtiHPmZhUEPsftC5u11cdmjSI3ypF2Toy2t32ypqk2GVXbyX4OdC+4kYbls/nFbxcnpxVrn50fZYZ08Wr4GZ8Wjh0KalVzcRFIl+H0XtGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e7kw53Ss; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e7kw53Ss"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8297b714548so693187b3a.2
        for <loongarch@lists.linux.dev>; Thu, 05 Mar 2026 09:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731176; x=1773335976; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvL7QI7vtAV/elV7wuwJjb0ouQ5MS/0W571Ri2ejdh8=;
        b=e7kw53SsSMt+893fYb3FL3sSVuo5UDrFozWX4NgI2v17tjwq2cjyKaObn8g6pSiq3v
         mQwVORDZ0AJo1o6KjlEIrjkq6Q/Moq4rxteVOVAzAJoIHZ3gVHc9eN4QSGyHsZxYZpKD
         AssA2by42Jk7hZM2GDosVstR/kJ5p7H4uhWMzm1T258Kcx6QmlFJEZO4QfanMs41QG4x
         1RsB5WW7l8jKbqHCtn+RvKwRsbVT961whdEutaaekfsY9bKEMlUUcYQwnPZL4zLxT5nQ
         molgIvRQ/En0OYJd0q5GadWiYuD4eypUzNGGbNnjyEUFR6OeWVlYql62S2mKpaAMZu5S
         FB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731176; x=1773335976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvL7QI7vtAV/elV7wuwJjb0ouQ5MS/0W571Ri2ejdh8=;
        b=QqsZEDNSATHAb68Dg+VA0R7p7mnvvfYXwcegb9449bKMfl7jt3+KtDKrwCSvGVVHiv
         vpEUDN4v5FFTx1rcycVriMmfdRD9aKWQlDZhq7N09ftUPE2WMFwdIu6Dp+5XSTQDUh2C
         6oG3VmcIAJVou1vrDAmpsf+t6iUdvgJpz2auZ97zTKGPJXOySQo78/BicurklbchF2hj
         OueQSuIW49bFe1bmDYUkl1eKMGR7eivXmTA5XzLAUK2GuMotG6r3vZ0iYmre29853lel
         UvVrnwE/hJdO4Jy/wbeojYyk3gMCtA2oNmHJt8pK78GzkHIkwR20fFCvzm8uTxsHnT2F
         PMbw==
X-Forwarded-Encrypted: i=1; AJvYcCXvy8NOa2oHMmzpVI5ahGX/um3J5vhh36/PqLtNvkTh3nBQqaU7Rh0HvYVVBnHnmCBABFEceidoWRs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/d0ldj9711BuQiOi219mEJBGd/kZ19nk8yb6blbOPcShH2aFM
	r1MFORyTma6nDGmOQloNpC/4k0DWYoUOpwG59ann2zngW9wqKgPhadeCFkH6grUfTgu0stA2rNW
	R1wnktg==
X-Received: from pfcp25.prod.google.com ([2002:a05:6a00:a259:b0:829:808f:cb8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4295:b0:81b:d5d9:a83a
 with SMTP id d2e1a72fcca58-8299ae60809mr419972b3a.61.1772731175885; Thu, 05
 Mar 2026 09:19:35 -0800 (PST)
Date: Thu, 5 Mar 2026 09:19:34 -0800
In-Reply-To: <20260220004223.4168331-5-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-5-dmatlack@google.com>
Message-ID: <aam7JsCyQ5Oacvl5@google.com>
Subject: Re: [PATCH v2 04/10] KVM: selftests: Use u64 instead of uint64_t
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 20, 2026, David Matlack wrote:
> -static uint64_t pread_uint64(int fd, const char *filename, uint64_t index)
> +static u64 pread_uint64(int fd, const char *filename, u64 index)

I think it's also worth converting the function to pread_u64().

>  {
> -	uint64_t value;
> +	u64 value;
>  	off_t offset = index * sizeof(value);
>  
>  	TEST_ASSERT(pread(fd, &value, sizeof(value), offset) == sizeof(value),
