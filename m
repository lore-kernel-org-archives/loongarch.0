Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C1B56B63
	for <loongarch@lists.linux.dev>; Wed,  1 May 2024 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714562105; cv=none; b=UmzirxOXSC6YHkUKOP/TBINqiA+jVZRKvA9uG/SxUl04vWXYUgytZ0u5pwSBMpFm1iFLqFUw1MOg7S+fGf/cxb15OPfmN5JyaOFBwktJf5d7KfixVic4XA7lboa03CxU2/ZeZ5sTAm610iW0bTYpLxXZMB4Ccy9peVmSxe9osnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714562105; c=relaxed/simple;
	bh=FQodAUfD1JkLmt1uTy5qfN1UspuJsm4imcTHYIOZ1zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxxIkpS6/dJyUtj32LP20c0kUTh8NqXZdb4OqHzUQgYIDmBZxD+fq5wFXsanJMFmoGtUbPDqq6uPfOXFkH/rUxt/27b0hTh0JL9w4Lzp9r2iK0hBoDdiUDdvVFiJEyvaJd8w4zKI0aqpQq7NpmGCFc5jnMlrztBzyBqlC1qu9+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QGRzVFwM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QGRzVFwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714562102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4zwGvBc/1zudle3Fu3mxvomgwnAp7EzJRWK4hmMCrY=;
	b=QGRzVFwM4PeI30rFlRkRFuZq6UB3Z4zYRNIcS2thKyTFmGdbjiEqDPFrroi6KN2bo7V+3D
	N4xNmBi8cBFgecv6LEnhRhKyLupXOaArDxIuQMREqwsMCtXhZMOdDhMxh/6t8YxRDesXQc
	RZlEsMJbCgdu8r7mfF+LQWsW8vv9uFw=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-ndK002qTPUawWdajqdV2Iw-1; Wed, 01 May 2024 07:15:01 -0400
X-MC-Unique: ndK002qTPUawWdajqdV2Iw-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2a4b48d7a19so647140a91.1
        for <loongarch@lists.linux.dev>; Wed, 01 May 2024 04:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714562100; x=1715166900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4zwGvBc/1zudle3Fu3mxvomgwnAp7EzJRWK4hmMCrY=;
        b=WeziHREMPFAVjnG0MDPCH8/DLGbNs8ibTYSFjbEIXYVrR2JqDcY8kE87b7MEU1nOl3
         NXgFghAXt6PMKlNuJNXuWQXmxG05IuMfXmNS26Z+yCqCU0bebT2Cp9XNlTpUsvCCtwTG
         soxIGQuIkG/BBI9mxrKy9sfAy9ShuGFPhW6520oijLdKBiwkuirNdKkHFqYs8dQv6lWq
         FAC8hbS9ZWqc0u2qJzaUytgJxPI7rps6Z8kQhhqGKB437MTVAHsKn/AkxJwoqH4+wtQ8
         zm7rJiogNljgzHuBahQhnZJfjKrs4YnaY9rht5YYVRAdDpq9zyfjR7K9emlmQZTcnaXu
         tskA==
X-Forwarded-Encrypted: i=1; AJvYcCXrPVZMk8vg+GKkKdsAEzB+4UkuVk1DaM8uWBhaYZoIP+rQ5l0+pzL7+zGl+4MAPftFs7xPdshG/RZAnnmnBuCTBY0iIEi9bQwI
X-Gm-Message-State: AOJu0YyJOGxxRX1E9zMAyh/3gEq+9osoMsj7rfALNElER4PCQkDx4dig
	gEXrKAgJ6PlTXeHO8bckFy2ffVHg30IBX5/hoPfqS1gJFRwBOaAk9MMFM4AQWxIr8qRHE+RHDdq
	+Nlrf06WHCMnx9iYmjkU7MDm/SlzdVd7ZBVPOeXorIwdQUUOfiYtDK4PJmw==
X-Received: by 2002:a17:90b:3749:b0:2b3:6898:d025 with SMTP id ne9-20020a17090b374900b002b36898d025mr189450pjb.9.1714562100005;
        Wed, 01 May 2024 04:15:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgkwe4UKKc3WldVwMV2boi6I+r208XEIsyNzplTWK4MFoORCuavWHQA0/i+SiniS3enNZ28Q==
X-Received: by 2002:a17:90b:3749:b0:2b3:6898:d025 with SMTP id ne9-20020a17090b374900b002b36898d025mr189419pjb.9.1714562099556;
        Wed, 01 May 2024 04:14:59 -0700 (PDT)
Received: from [192.168.68.50] ([43.252.112.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a17090a050900b002a55198259fsm3245338pjh.0.2024.05.01.04.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 04:14:59 -0700 (PDT)
Message-ID: <27e48da5-e1d0-4e4b-978e-954f1766c350@redhat.com>
Date: Wed, 1 May 2024 21:14:50 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 19/19] cpumask: Add enabled cpumask for present CPUs
 that can be brought online
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, x86@kernel.org, Russell King
 <linux@armlinux.org.uk>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Miguel Luis <miguel.luis@oracle.com>, James Morse <james.morse@arm.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Hanjun Guo <guohanjun@huawei.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, linuxarm@huawei.com,
 justin.he@arm.com, jianyong.wu@arm.com
References: <20240430142434.10471-1-Jonathan.Cameron@huawei.com>
 <20240430142434.10471-20-Jonathan.Cameron@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240430142434.10471-20-Jonathan.Cameron@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/24 00:24, Jonathan Cameron wrote:
> From: James Morse <james.morse@arm.com>
> 
> The 'offline' file in sysfs shows all offline CPUs, including those
> that aren't present. User-space is expected to remove not-present CPUs
> from this list to learn which CPUs could be brought online.
> 
> CPUs can be present but not-enabled. These CPUs can't be brought online
> until the firmware policy changes, which comes with an ACPI notification
> that will register the CPUs.
> 
> With only the offline and present files, user-space is unable to
> determine which CPUs it can try to bring online. Add a new CPU mask
> that shows this based on all the registered CPUs.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> v9: No change
> ---
>   .../ABI/testing/sysfs-devices-system-cpu      |  6 +++++
>   drivers/base/cpu.c                            | 10 ++++++++
>   include/linux/cpumask.h                       | 25 +++++++++++++++++++
>   kernel/cpu.c                                  |  3 +++
>   4 files changed, 44 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

