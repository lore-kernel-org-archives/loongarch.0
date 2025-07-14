Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A652356BA
	for <loongarch@lists.linux.dev>; Mon, 14 Jul 2025 08:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752480669; cv=none; b=EWQUI8U1YK5SA/MAzXMlzQyeqI9G2AOmqiFJZeIZYYsBVUHAvskKJE0OyXZH86YCOfRNtzjN2IHqmujZfB3JEezDWPNEwhNhGGeiapPJLkwkOUaWHglnck7s7QWbdK3ND+of31pnC4HtkMGaRZKtjJkw1izkoufXScMsiydnHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752480669; c=relaxed/simple;
	bh=EwmAdiBY6IxdYC6thxEag7Sg4d0A23f83h0plUfjyMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BchoqDo4sJEuS0iy6WQuA9WuUE+iqYltwyMJyQIqpiM+Oi+Pcql2CDHn2i54U5Ti+4SoQqb5hdBX/lL+YXyUP+GHJcQ470lXG86J503e6qfFyyAO5Z1NGy86ZL8qxFGnrXKHwYeIRPMAQkbRpBPSZEdbdWSszvLn85my/SO0uFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=dN4DmX0D; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="dN4DmX0D"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 882813F66E
	for <loongarch@lists.linux.dev>; Mon, 14 Jul 2025 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1752480659;
	bh=nqw+Zq4IYXJ5LysW9CQUZGqMpjh9E9bB5LqggaTSXJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=dN4DmX0DLUqKv1ro/VkcSZ9jYhJ4VpK4hCWo8mLw6Yq8lstvkdGZWF9rB/FkGpDuU
	 FJdfSeqKPPn8QpEgthzmHd41uHYNzPxUIU8uQMTYY60XglXSwhWVc2lPh6vnfByPIV
	 15oA/0Fhq1M6ikg/3OxqGcS+Ad1UBqnbJEWYRaHZMYgbH1y5SDfxnYr+2Ene5K01WT
	 bH6InG3dqPrvkN+k6MeDA5kfZaHtX23f0iM3d4EjYzfCzkFWoH7Y3QNcle5G6iu3//
	 rkxCBIig0HlKpyEmI/ovydri/zyYQLxzm9ZYDOKdSp1QUoZc32HMmFrwL7KPssGgAx
	 zThu4L+n/ySoA==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-adf58589c90so506588466b.0
        for <loongarch@lists.linux.dev>; Mon, 14 Jul 2025 01:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752480659; x=1753085459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqw+Zq4IYXJ5LysW9CQUZGqMpjh9E9bB5LqggaTSXJc=;
        b=AhQ3HT+UxRoxUYnyD6XjC2uD3HUk1MLhlgTAnbqD8VO+8etav5rgeLb/9kbjji17af
         bbPSFJvW6F9fuaqZnyEsKbiPRA/DTSOE/qmAidlFMbyRc6WQbJ4aLl+xTI1e/dGijS50
         ylEyVfiFU+nBnq5vQtV9eCtIVfZmn8JnjCSmDlg7Vtr/lZ/e7D3nMdWiKxBmwhzLARq7
         KcjnCp8KDzqQTQugnIbbykFdgPBenePRP70VzQMRU999vdIuU6+KRZltUJjbY0BhK5M6
         nGvIEBqDo7Bx9h1FfvmuervVuqZqDFpbFHbdOJZhDn9rCz8LIIc3IbmGqhqx2uUA0/AQ
         /f8g==
X-Forwarded-Encrypted: i=1; AJvYcCXSbgMakWEhW28+jsYkd87jHR95mSs/JLf6Lcm9A58jh5vdMmtgl2rUuopPFANgNZPOev22MsEqtZs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq+FyGwqsAguVaw25jrfd3xef3DvaV+SMmlbTFMZZL7owyjMbG
	0R6k+3y6EsLfcHadr/yRtoQp5ULfO75fBc7rOuQ1dZPhDwEoIVQ138DT7lJbvV6gt1cTJ8szxtO
	aoFXunefk+zvLZ2PD8ofPQ9cvIATXz3zylgyTnJsFqARmcfa4b9ZmcRrpZxg7LNhXHBI3/jVJEI
	3MAg==
X-Gm-Gg: ASbGncvvonSw9grj3J2BZRIyoZ+hb1y1qTiAhHXLp/3+uBwftpwx3PwuUoQFvOt9CKz
	XMOtzln8iV17McFgrzF7q5vDvlw1HnhLfJjyhaq6QWEBYpIpzW9QUnjAu/iWTuimEqZRJrMnKVt
	aPiE1hwVs2LtdfnAbsVdx3BFNQjI6UcjYQsdTogm/wwy3Og7FmwqftbcL3vl+Rba01fkIKNw8WX
	/0TefhgZHJGCuT6Ysfq0iGZLu3NW1mPbNlpAeHl0S69JpeQX9xVJjPYAECR36tCMiQAry4gwi8T
	gOiJGSlkclYMIiYTPl3+MZ6CE4IT7Tn1q2FVe/o/GJF3X1KY3Bm5eA/BmSI9NL8=
X-Received: by 2002:a17:907:9450:b0:ad8:adf3:7d6d with SMTP id a640c23a62f3a-ae6fb8a57eemr1155260866b.21.1752480658893;
        Mon, 14 Jul 2025 01:10:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVNG4cGhbgl6DZuAszmrlgOEZ5D4CwRcSMPsKcvD43UnpSt6BkYsm9BCpJ8sMqD6XmPCotBg==
X-Received: by 2002:a17:907:9450:b0:ad8:adf3:7d6d with SMTP id a640c23a62f3a-ae6fb8a57eemr1155257866b.21.1752480658379;
        Mon, 14 Jul 2025 01:10:58 -0700 (PDT)
Received: from [10.27.73.177] ([212.144.242.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90b09sm770592166b.25.2025.07.14.01.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 01:10:57 -0700 (PDT)
Message-ID: <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
Date: Mon, 14 Jul 2025 10:10:55 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Bibo Mao <maobibo@loongson.cn>,
 linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250714060843.4029171-5-ardb+git@google.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250714060843.4029171-5-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/25 08:08, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Using EFI runtime services to program the RTC to wake up the system is
> supported in theory, but rarely works in practice. Fortunately, this
> functionality is rarely [if ever] used to begin with so we can just drop
> it. (Note that the EFI rtc driver is not used by x86, which programs the
> CMOS rtc directly)

The main problem I see with firmware offering access to the RTC via UEFI 
services is that two different drivers, the firmware one and the Linux 
one might be trying to access the same busses or registers which might 
lead to unexpected results.

Recently there was a discussion in the RISC-V technical group for the 
server platform specification where the same issue was discussed 
concerning SetTime().

As a UEFI firmware should not care which operating system is booted, it 
should be up to the OS to disable EFI access to the RTC if it has native 
access.

Could we disable all the EFI services for the RTC in Linux dynamically 
when an RTC driver is successfully probed?

Best regards

Heinrich

> 
> The same applies to GetNextHighMonoCount(), which, if implemented,
> usually relies on SetVariable() under the hood *, which is often not
> supported at runtime by non-x86 platforms. But it has no known users
> either so let's drop support for it as well.
> 
> This means we need to drop the slightly pointless tests for it too.
> 
> * EDK2 based EFI implementations usually have a MTC variable carrying
>    the monotonic counter variable, which is therefore not truly
>    monotonic, given that SetVariable() will happily overwrite it.
> 
> Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Cc: Feng Tang <feng.tang@linux.alibaba.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> Cc: Bibo Mao <maobibo@loongson.cn>
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-efi@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: x86@kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: loongarch@lists.linux.dev
> 
> Ard Biesheuvel (3):
>    efi-rtc: Remove wakeup functionality
>    efi/test: Don't bother pseudo-testing unused EFI services
>    efi: Remove support for pointless, unused EFI services
> 
>   arch/x86/platform/efi/efi_64.c          |  22 ----
>   drivers/firmware/efi/runtime-wrappers.c |  68 ------------
>   drivers/firmware/efi/test/efi_test.c    | 108 +-------------------
>   drivers/rtc/rtc-efi.c                   |  76 +-------------
>   drivers/xen/efi.c                       |  56 ----------
>   include/linux/efi.h                     |   6 --
>   6 files changed, 4 insertions(+), 332 deletions(-)
> 

