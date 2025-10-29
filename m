Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1898A2DC35F
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761724349; cv=none; b=eSvQkliqj3dw3rxtrFm3XhEJ5wkVs+FXVxuQbLdIHcnPb1pqBDvDz0qv9ewowgyr/XifiA2hlabRd653qGVshOddA4a6onc3YDuVNmforw3e17ZMJfVM8xqC9vzh4aS0Ytva8NeL0BHj1StDXATPqVE+2oQZtQxj/cva43WR8a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761724349; c=relaxed/simple;
	bh=IMW6BUzhnHMYMMh4rjjj8cnueWo9qTKE34YZ47hy9cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bAlT72K8Q4N4tK1pIDBKvdFkg/SsIxsg7WJdXC6SIVhws7KQXpkMtmDCqlQRhkrgI80pdWZFR4kkOq3Vtk9PF8hG4OrcjS1GtJnw/gKhCgjq2krR/kxTeTwl/ZBNwLvD4Tht4OMMYpRNfjEb36Hms8YGsfDev75Hp2i2fmNR07I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKBi1+ao; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKBi1+ao"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29470bc80ceso9934305ad.1
        for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 00:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761724347; x=1762329147; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OYK/28I+NJFr6r7cOZ0pyoRm8+eA5vm+A19ZLzCLbOU=;
        b=FKBi1+aouNEMxyZh5z34MEV+xJBcnQ6MUpsRo1jAvwDfBjXOV5ND/ve3xQgUQEte5Z
         Zg4C96P5odjmUMNe4rvK2L188BcufhD1pPbEM8C17ElAGT0ZeOduQ3KFGdT6EF09z7lQ
         A204Z8VnmT60zG3Ya63vFLoAX4CD6tMUgK30uTkR4D2SPaRnqeEdcnKrf1LFaQmkO6Gs
         YLNssF7dT0YKLoyQEKfmk6BCQ4+Wa5AYb71wKwW95BAwdlJCSfCVqJmSjcNqvBTgM6dm
         67XMe45rZLCO0BsjqYKtRGdKA9JXT6le0OYUPVIU4hpRc8Jy2pZakkCN64V+Q0flNEyI
         QFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761724347; x=1762329147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYK/28I+NJFr6r7cOZ0pyoRm8+eA5vm+A19ZLzCLbOU=;
        b=SWW3e9qyqut5tVNhKXf0WD5WthW8uqXzWKlgwIdQwdKamZB/PZ+uSwQYy5npxkbU4Z
         UjLRttCoiTBVqb9UGZWH/A85YjNEG5jIskMuApem7wwnRwQa7ocMu4Btrk5RVV/hF+H1
         LwpCrwyDlCLmtP03MbavC3MLNMYXF1nSESzjtNLyJIOkNPyqxMcddZI9yqh5pji19gJO
         DeKbBaSJzT7mMk2v1lZAvmOIV+beA7XqVHc2PqlzOOR4c38vV2ycwq+NAlgrYRggJWUY
         N0avf6mJa6kBnDoxC0NSO973SqDHfeWMBh8Zx+ZKYRt1lfJrGlaxrH54Ms1SIpMCmzy0
         CRzg==
X-Forwarded-Encrypted: i=1; AJvYcCU9T+4Pb8V/BfVHhr/dGXUJCAB8ZrhfkqP1FINLkpB78BE4Qm10ss6QtmDwxkS6tOuEPBlRqM01VeU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRospirMAJH3ur5N817DBHKzYAB3ZmBnn92bGHm+cXpdAmyh48
	9ky6wEVHXRWDT72TupWWaQHGHZsCvZ9HsT3OcFGj0LnA1IW6DHcM5Mkw
X-Gm-Gg: ASbGncvSmCtX5wHPQpDNQhVcsaqGUEQiY5OoxcMTX3NabREdMV7Ad3k3VBr/dlcJdcQ
	x7Kf1jpKoLGEUZyam8HbXh4bN8YZE/uWguJC3y2KUIybKFpK6JnK7SCan9aon2LBNvmaTnSTxe0
	9+vvSX/C1TwQ+fXfbrzniiKqdotG1+NxAb1A4CpCfLm84R6E1PD+tS1XhXOWJaP+3qQPNDJirLa
	vlx6dcVCUyMePlPG/H4OuzWn6DTjpVXRQtmbL0q2xdtHxU3O4rUXDvEjhqwe0CqalB7ZLHl61pa
	Il+nLGbiij/SqDqYN70Lv33kUNkZMl2YLLPs+VYB/OqiG7c5zbJOV7qDpeB8dU+37yEifKFsAvY
	2y9hSGYJQDtScXKJrHIVLlsf/eDUmnSuHhAOdw3FeAMFxyIo3Jhljt2gmCzgrDiltR9yLu9GlDb
	7xCy3SwmlElCxLLnlykgrtDGo2R6zWuAOT96DXKoY+4WhzgXy4qeycpLd2+y4=
X-Google-Smtp-Source: AGHT+IEb5Ookn0tin6kAZTcUD2AapsuRm707UiU7RfKGYivM+xG1NILduFa/3DqxJ9NW8z15wyLDwQ==
X-Received: by 2002:a17:902:da84:b0:249:71f5:4e5a with SMTP id d9443c01a7336-294deb3445bmr24345535ad.26.1761724347170;
        Wed, 29 Oct 2025 00:52:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d42de5sm143526395ad.76.2025.10.29.00.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 00:52:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <85e146d6-9f8b-4d3e-848b-31aee79d66be@roeck-us.net>
Date: Wed, 29 Oct 2025 00:52:24 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] watchdog: loongson1: Rename the prefix from ls1x to
 loongson
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 loongarch@lists.linux.dev, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20251029020847.1946295-1-zhoubinbin@loongson.cn>
 <20251029020847.1946295-2-zhoubinbin@loongson.cn>
 <dd97339d-a984-4e74-8043-be99046c5102@roeck-us.net>
 <CAMpQs4L2cGjTFUWAkFaXuvYpHS-SYC=8X5HD=yR6aQMkdvr9xg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAMpQs4L2cGjTFUWAkFaXuvYpHS-SYC=8X5HD=yR6aQMkdvr9xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/25 00:33, Binbin Zhou wrote:
> Hi Guenter:
> 
> Thanks for your reply.
> 
> On Wed, Oct 29, 2025 at 11:39 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 10/28/25 19:08, Binbin Zhou wrote:
>>> In order to introduce the watchdog driver of the Loongson-2K0300 SoC,
>>> which is similar to Loongson-1.
>>>
>>> As preparation, rename all prefixes from ls1x-specific to
>>> Loongson-generic.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>
>> This is unnecessary. We don't rename drivers or function names because
>> other chips are added to a driver. Doing so causes unnecessary churn
>> and other problems, such as (in this case) loongson1_defconfig no longer
>> enabling this watchdog. Any userspace depending (for whatever reason)
>> on the driver name would also have problems.
>>
>> It is ok to make the driver more generic and remove the "1" from
>> the Kconfig description and from MODULE_DESCRIPTION. However,
>> please leave function and driver names alone.
> 
> My initial thought was that the loongson1_* prefix might cause
> confusion for others, since we aim to support watchdog driver across
> the entire Loongson series.
> 

Off to Wim then. I won't approve the driver/function name changes.

Guenter

