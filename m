Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733D5224227
	for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 22:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753138788; cv=none; b=SahcqmQsnodCshgE5AFh/OdfWaarjnbeUhch32Psp2zCEmpA2zKzPtQVO4qXpQwTij8ftIM9NgoKUh55SE6EMr9AL877P8psWf3Fx+9cEOTtEGcKOrtBSXfNPHLmrXva5wwn/wJ4WYOT+7j+BEcjwzg1Xz8Nb766IGYeQ8EraXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753138788; c=relaxed/simple;
	bh=+7tVxomXlBN2ep8coxou7cFT9C4R2OKsqiwHvfpGarw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sUdA0vsG+rmZcc7SMQmUpQR6dtNziDYWNWLogLUTygc4fVuvRpf4VkQnber79KA6oS8VynfXgJa0SfXueGkL0oDQT9U/pcV0agJ77bYuhtDpamotT6p0kXEkjyYtu+pJxXh1Lxx34RqfTnnECgCpU22xtP1tTZuoCmixh/pMN58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9TVyoQz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9TVyoQz"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6089c0d376eso876151a12.2
        for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 15:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138785; x=1753743585; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qziS/qpONFFAWWmGEcjsGqxLtdqROLsiMhv3HQa+DVo=;
        b=V9TVyoQzuFLkz5a5tOsSgWNE9QQo7m1UoQR3xXDRaveWqPAu/N3BADd2uMO71sTal4
         cdIg8qSThxDf8uuBmrte4CINVVRMJYsXKSFhYpLt1SWfzbY2yME+UOA8TSl+Exhi1XK3
         JghWU6Npf/3hymw6mhgPxyqxJ6VWYhlE9MnSKH6car7gXhgyAJT9Yikg9RLUBybeXZfb
         pXKbEn8lF90SU5gSkH3xLr4MY0S28pFBbqYoBAlaKx9F2C6OlE9CkbQ6YdNUZMk8HhT0
         9UjV3jqGMF32DrwWSUWpEDB5ukXva85bHhRrDGHn+S4hQb5Gw9CQwahIh3xxVi0I+vhY
         Ph7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138785; x=1753743585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qziS/qpONFFAWWmGEcjsGqxLtdqROLsiMhv3HQa+DVo=;
        b=midsyZZSLxRfp/QB3taBcy5rQsHELUFmNKdE0mAuUvseh0ht4P8KAubb8wHnRNimwZ
         kRTkFlruIYYNOS10wKzBY7J3Ce0aMNu2w0nZnXcUPW5CQMwldcPqRSX+9WystQiBjmaG
         mns61CwxuNja4qTClPvO7Wx67TQ0iHU9DzJGU7RbYbTqE7E0o5Rw+l8OyE4/N423hzHc
         ONBAsKNvz6ajCCBEKhJtQdBzuPt51f5IeKiGKn3ChFkbehi0bLCmSn5idcIjO8QYa1F/
         ngJjyIMf1EoNOm40T1Q/AQLA8szkzL+OQecwmyqznCjTsSO9tJhs/bhFcAt49LoiI8Bx
         ETbw==
X-Forwarded-Encrypted: i=1; AJvYcCX7EIfDJE0hQKtMRN/D/HkfFriZE96184aZQuEVYR4MEuwKNaS4/45R/uTT614mnQIZVQ7OkAPsw1c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBgfTx5dVtGCZzlGtuE6PKj69JFiJsqiQI/rtLgyerT2n1akHm
	JA3wSbFncnw6Pkmrg88DH9RtDKo3I4iNrC0NnRpKzR9oYXHGSEQrz6sc
X-Gm-Gg: ASbGncsQXyHVrMsW1T1r44L2qsahc7jbVHHb89/9ay17wqjpPyREfCQEZ9MT6nY4u7l
	1D5/IacnsIn1HG1qt+qo+Pwgw4v68woiZRMk+oqc0WvYWM47f8WpdRy8Vhudgp0SdW2XLdnwA48
	dZwLttJdLoBWzXIzsoxgkmPmhaAbc2NppfNsa96ieFxWsY2dPwouw46AK99wzlqq4aSDcK+PIna
	BN8l7nP7QT/cfBqh/sY3YaM3K7eb/EkMgIM+0473eC2kgLC/poaJgxIvsdbnYruFCm/ErBRPF3m
	lRqibcEFUEuoVRBEoZRg4XgWc6YYH/z8i4re1I3cgiROwpNUMkRYOkFSKRZN40JZBfm/eIRI6/V
	40Enk+8DlztVwZac7DwtGaqx8Bli8sA7dYd2/f5bw12LhMfiSB1hpbNUaTcX6GKqtyuwV
X-Google-Smtp-Source: AGHT+IFBO2iP/n38Feyyqa7ON62IpV2R/kvBKzJAAeBv02jcMXCr2o0KVEmn950sS2xc+ad0bPTgUA==
X-Received: by 2002:a17:907:1b05:b0:ae3:bd92:e6aa with SMTP id a640c23a62f3a-ae9c99adb7amr852181266b.6.1753138784434;
        Mon, 21 Jul 2025 15:59:44 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7d330sm755829066b.126.2025.07.21.15.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 15:59:43 -0700 (PDT)
Message-ID: <f10f3599-509d-4455-94a3-fcbeeffd8219@gmail.com>
Date: Tue, 22 Jul 2025 00:59:23 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] kasan: unify kasan_arch_is_ready() and remove
 arch-specific implementations
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717142732.292822-1-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:

> === Testing with patches
> 
> Testing in v3:
> 
> - Compiled every affected arch with no errors:
> 
> $ make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
> 	OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
> 	HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld \
> 	ARCH=$ARCH
> 
> $ clang --version
> ClangBuiltLinux clang version 19.1.4
> Target: x86_64-unknown-linux-gnu
> Thread model: posix
> 
> - make ARCH=um produces the warning during compiling:
> 	MODPOST Module.symvers
> 	WARNING: modpost: vmlinux: section mismatch in reference: \
> 		kasan_init+0x43 (section: .ltext) -> \
> 		kasan_init_generic (section: .init.text)
> 
> AFAIU, it's due to the code in arch/um/kernel/mem.c, where kasan_init()
> is placed in own section ".kasan_init", which calls kasan_init_generic()
> which is marked with "__init".
> 
> - Booting via qemu-system- and running KUnit tests:
> 
> * arm64  (GENERIC, HW_TAGS, SW_TAGS): no regression, same above results.
> * x86_64 (GENERIC): no regression, no errors
> 

It would be interesting to see whether ARCH_DEFER_KASAN=y arches work.
These series add static key into __asan_load*()/_store*() which are called
from everywhere, including the code patching static branches during the switch.

I have suspicion that the code patching static branches during static key switch
might not be prepared to the fact the current CPU might try to execute this static
branch in the middle of switch.
