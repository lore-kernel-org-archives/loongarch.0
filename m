Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D5715EFA1
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725884183; cv=none; b=RR+MbiAzx5WBx8kKOjrN5gX1SHgVEIK7kl1vREXgCnpJmm2L044R+VPsJJ9+cxocBmTM/zYtLUAKc7eHQaWjt380lf0W8AWH5FO1ir4bgXZJtJZKLppFQ2rdmCrJHLElsJWyNlgdsnxRfc4lZO7vaiF15/8x4IeZYyOZ4A4fzdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725884183; c=relaxed/simple;
	bh=RWj3XqX8Nl9ZvEaZRWgMI0tNYmiYxDpGbyz5uPwusho=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QvZfUcK6FSEvedeJwNRfpDKaQxVcJFBMDlCY0VjPSg4zbu8OYnUzc7wu3GS3nN4QkbpkUPtMwKOMU26ICb+jwjv6DWYcVMsoOKAMYLhM+HoAEXel0oGAvW9uXrN3nS0MlsKzIHuvqhWWJFTXM0g/nW+B0WBiMfdfIfGf6d6Lw+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARYPmPSr; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARYPmPSr"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7179069d029so2933202b3a.2
        for <loongarch@lists.linux.dev>; Mon, 09 Sep 2024 05:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725884181; x=1726488981; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gPJ7uHySGWvGCBzUZkM0XzRLu8h7eCfH2Esu33AGR14=;
        b=ARYPmPSrb+APAsTgjb13qHK2i2b+R+zfpSeFOuhXSk13Xsmn54lQSUk9rqR0Si+FjJ
         zAunG8s6sUSCRhvmO4lYeRJGVgza3ntoioEd/bRlU85bQmdoyf8UY6XwrVsBCM7rRawZ
         u6wKYvy4swsro+sCbL5nPKuGS5Ef47ffOrxtjr7YZ+aZzirZq6h0flHe1G8CZZO7aGsJ
         LOoQ+Qu/RzDDVi8ilC/trZGWgmY12GxHRzzV9rt9dTrRVu6AVu3ZJGYJETTeJ5zcJKBT
         XZl1d0Gx7rNiBM20VSoN8+A6GpP37QuJx0BeESKNaOdnolLoLaM2PT/TOqsmjeeCVXoJ
         kB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725884181; x=1726488981;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPJ7uHySGWvGCBzUZkM0XzRLu8h7eCfH2Esu33AGR14=;
        b=aKOOa8qLII6yyxBNfX5HI6eSxyHXN5EKwWDbCdEi1vqARLCI1MxDIoXamD7SEAtrPV
         DBNVAZVPjJyWRzCfKoHFnE38pD1U8CStx6u4u+5pF1K/7hzirsDSCsx2qKZEitwtPCCU
         uizmTt42f0GcXVG66wSyOYnDGjTbz1RKAojhMOnxvvqFz9WiPHbQgDEsjHvhBc1ZdClB
         GPUN9BnsZvIP5/+uMf0HwVZpH3ZtvV3vkWLJZseqp6JLK7P/2oe+H0IbpeOsYcFwGBK9
         5MCpigQGB+34mufMSkowlV8nc9E2rhb29NvgYBe9zfufP6LI7B8a10xo0xfhZEvp6UJ7
         KlIw==
X-Forwarded-Encrypted: i=1; AJvYcCV+aWWlpCZn3tnXPo3P02yOGMb7tl7+eli5CTjYESPJqoBpDfXLksoLi2e2zI62YbwGnaM53uIaj5g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpgCmhmRVHSJKgcJQOJXZcZTqd18JPUt0+8ulUWYMTH8zXnd2z
	hwbTzzlCOVtyKnKxVhH72nGo6UGt7RNXLPQckeMNMQmMvy4TqJ/j
X-Google-Smtp-Source: AGHT+IHM6o7g7DPr5Llw8JRr5tP9jGrL5l9uJZb1UkPnnG81PEEIs9bo2qQPnTUWF40R2wiNKVBM8Q==
X-Received: by 2002:a05:6a00:4b16:b0:718:dd1e:de1a with SMTP id d2e1a72fcca58-718dd1edeb4mr8053950b3a.28.1725884181407;
        Mon, 09 Sep 2024 05:16:21 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e59687cbsm3397730b3a.115.2024.09.09.05.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:16:20 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
Date: Mon, 9 Sep 2024 20:14:16 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
 <20240823-fix-riscv-rt_group_sched-v2-1-e4dbae24f7e1@gmail.com>
 <20240909-gave-celtic-af2ea8bc38d5@wendy>
Content-Language: en-GB-large
In-Reply-To: <20240909-gave-celtic-af2ea8bc38d5@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-09-09 19:53, Conor Dooley wrote:

> On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
>> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>> introduced it because of Docker, but Docker has removed this requirement
>> since [1] (2023-04-19).
>>
>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>> needs an RT budget assigned, otherwise the processes in it will not be able to
>> get RT at all. The problem with RT group scheduling is that it requires the
>> budget assigned but there's no way we could assign a default budget, since the
>> values to assign are both upper and lower time limits, are absolute, and need to
>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>> with values that would work by default in the general case.[2]
>>
>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>> can only be enabled when all RT processes are in the root cgroup. But it will
>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>
>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>> support it.[3]
>>
>> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
>>
>> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> 
> I don't think this fixes tag is suitable, the commit you cite in
> moby/docker is a year younger than the one in the fixes tag, so it was
> correct at the time it was written. I think the fixes tag should just be
> removed, since that commit was not wrong. Or am I missing something?

The Docker commit I cited introduce the fix, not the bug. So it should be later
than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wrong
config from upstream.

Timeline is:
1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
              in fixes tag.
3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
              commit I cited.

[1]: https://github.com/moby/moby/commit/fb85a99f5899df7475ba6b1ac4b2e1d32974eca2

> 
>> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
>> ---
>>  arch/riscv/configs/defconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index 12dc8c73a8ac..de85c3ab261e 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
>>  CONFIG_MEMCG=y
>>  CONFIG_CGROUP_SCHED=y
>>  CONFIG_CFS_BANDWIDTH=y
>> -CONFIG_RT_GROUP_SCHED=y
>>  CONFIG_CGROUP_PIDS=y
>>  CONFIG_CGROUP_FREEZER=y
>>  CONFIG_CGROUP_HUGETLB=y
>>
>> -- 
>> 2.46.0
>>

