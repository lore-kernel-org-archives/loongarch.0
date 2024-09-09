Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D426717557C
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725887694; cv=none; b=RmNL16SWInIXKF0eahAyJD9GuyujgXZONjb0/mgNnV4DVWvLa7sm5ANzYWbVQABcJ1HHanN4CTD+IeIJUbFaPqle6qid8cP5sDfTf5ZZDCNbLsZuT28PlSrkKpLHBn/uq1r1Wb0Zt4P586OCszdZBjZryXczWWFTwH1pwQenuxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725887694; c=relaxed/simple;
	bh=9Sg+fnMmVyAN3qAVnnTdGEPx4hzaDBZUsOYGrDgbLZo=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uG+QP6EDpkG9ffQq4zIBG1AXV2qcUayiYRNJMPAaWfzrRx1/JSCd68Dc9aH7iDQfYDs9cmJi69+qii16w39rDhVkslhSCyUcawyEC2Q2jMpPLqcX6ETO0F/guapSV3e/nUfvvQxZnfKkViyWtStfz0+w3veiSPfmGRgAgb319mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsbJtvXc; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsbJtvXc"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-718d91eef2eso1890728b3a.1
        for <loongarch@lists.linux.dev>; Mon, 09 Sep 2024 06:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725887692; x=1726492492; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6Cd5fhD8ici5afX6+xiG5utNAqtTvz1M5Dqy2BN2P8=;
        b=DsbJtvXczQCLVSJferyeayWjrcy7VFbjvFKOYJHU56NnHKlaRmIkwW+oYikmK+COvJ
         tMVDQI2TOC8eNkAHPzt6aZUZ2eOZ1UUX89ZLi/BLtHmJXmnOdj1z/UusHnHbh9ZXWwEV
         aHCTkGo6Y48A/YYAC07uLU0hhRxmtk6xryhaKUux3mXqbfIMyuSvrYibABwOyGw4dUez
         xZ5ZvwzO/gT9uT8ACWYWyTA9wzx2RhS7+7dOrAGV/lJGPCMn+78HRFx7mC7S228/Tn5c
         7uOEl7WXvF66bQxqeY+nQwEXKa0+GxYNBAYiUdNMPwWEfYwvO8nutBRWN5KfNdJ9GM28
         5Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725887692; x=1726492492;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6Cd5fhD8ici5afX6+xiG5utNAqtTvz1M5Dqy2BN2P8=;
        b=fdqP6QWAZ02l4Tb2TQv4/31C8zf0nroCW9gmb9VDK2msDxlPyP4Dfw24+mHGS4zJbB
         mCWWDQnWZISUHoBFj2Ejk87Pv1JQi1LySW8r3Odu/UT/ULTMVu9MkGsfeEk/899XsqaW
         qYbtfL914aVWJGGKA0E/AjlPZBvvah5eK35bM6M6hvSAnDOxqMYePXLE15fD4dXUyPYp
         RT26mhLyMZjzxqkdCD2NyGIV5G5o2Kilcn8iwncw5ZWBydq3OdJsWiZk9ovV+3LqVafT
         iKL49pE5b/1gafUN++cvelF8TO7ZU3KxRLhTIlH5kG1b9aUa56lt0Qags8CdrHaTjSLt
         X3dw==
X-Forwarded-Encrypted: i=1; AJvYcCX8EybBXpyngu4ge/KKhYyTuTuqrtzw1HLGbiYnQ4cmNmom+KyqBTPrN5kBcyt7aLJVTIgoseC0rpM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnqdeGN1hrun/L33os0RZr84UU45ldKJq6zI95xCq5WsVEhxUP
	q5rZnCfIAzqIfLV01wXtE6AxL7OA5+2usUuBacQSfonfdKUo3gW/
X-Google-Smtp-Source: AGHT+IGnhYZgwGNXFcQ7s7STKWrNIO2hqlAK0VnpZ8PE0GryIBXkZ1t9udpbTlWICo5af882CgWSiQ==
X-Received: by 2002:a05:6a00:6f0e:b0:712:7512:add9 with SMTP id d2e1a72fcca58-718d560bb37mr13347863b3a.13.1725887691912;
        Mon, 09 Sep 2024 06:14:51 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5897d43sm3496400b3a.28.2024.09.09.06.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 06:14:51 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <e8f204ee-55d9-4a65-9fc0-582e361183ae@gmail.com>
Date: Mon, 9 Sep 2024 21:14:43 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Content-Language: en-GB-large
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
 <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
 <20240909-arguable-detection-02445bd1cc89@wendy>
In-Reply-To: <20240909-arguable-detection-02445bd1cc89@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024-09-09 21:06, Conor Dooley wrote:
> On Mon, Sep 09, 2024 at 08:14:16PM +0800, Celeste Liu wrote:
>> On 2024-09-09 19:53, Conor Dooley wrote:
>>
>>> On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
>>>> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>>> introduced it because of Docker, but Docker has removed this requirement
>>>> since [1] (2023-04-19).
>>>>
>>>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>>>> needs an RT budget assigned, otherwise the processes in it will not be able to
>>>> get RT at all. The problem with RT group scheduling is that it requires the
>>>> budget assigned but there's no way we could assign a default budget, since the
>>>> values to assign are both upper and lower time limits, are absolute, and need to
>>>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>>>> with values that would work by default in the general case.[2]
>>>>
>>>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>>>> can only be enabled when all RT processes are in the root cgroup. But it will
>>>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>>>
>>>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>>>> support it.[3]
>>>>
>>>> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
>>>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>>>> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
>>>>
>>>> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>>
>>> I don't think this fixes tag is suitable, the commit you cite in
>>> moby/docker is a year younger than the one in the fixes tag, so it was
>>> correct at the time it was written. I think the fixes tag should just be
>>> removed, since that commit was not wrong. Or am I missing something?
>>
>> The Docker commit I cited introduce the fix, not the bug. So it should be later
>> than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wrong
>> config from upstream.
>>
>> Timeline is:
>> 1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
>> 2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
>>               in fixes tag.
>> 3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
>>               commit I cited.
> 
> Yes, this is the way I understood things to be. IOW, when Heinrich wrote
> ba6cfef057e1 ("riscv: enable Docker requirements in defconfig"), it was
> a requirement for docker. The requirement later being removed doesn't
> make his patch incorrect, which is why I don't think this is a fix.

Oh, you are right. I will send v3 later.

