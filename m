Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792BF292B26
	for <loongarch@lists.linux.dev>; Tue,  5 Aug 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414400; cv=none; b=EBiCRAcOm0Pi1uA3joieiMJaGpAWvl56x+BvW/JPC5Jo6hwUOUa4+KlWiWRcsnwNG7E6n4oU0+aSrTpAGvBjc/2/VYW4WtZ3lubSR8LdN4yiVotFQVu3PxEfUmzWN2LXxR2BM6YnFR1r2t5F0zAVAQ/J74AR0f+9R5W+OZ9vyDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414400; c=relaxed/simple;
	bh=vAXnpuKxs/l1W6Pm+Trii3WWl/FJ6RefL0KkHMHqok4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4aO/mO444LMbH7wofIbMhpEYnbARKENS3t0fSh/QYIps/+Lszeljw9EatRIj32IoHS82OcqRY9rmzkdpOZdkVfA9fBwzugJxo3aDWuXbvW8EIy5ZOiHHusW8CIeYJHsBWpgl23GK3cMSt9YP+MMFtNYTw8bUuGLhX1/qYegboc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aW81Dg/Q; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aW81Dg/Q"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-332308477easo6583781fa.0
        for <loongarch@lists.linux.dev>; Tue, 05 Aug 2025 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754414396; x=1755019196; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/FfZaSan1eV7HDF3Wa83lEa0xPcSUpZYrzYE5G9wjk=;
        b=aW81Dg/QHl962LFolvLLHrb8Rhk8vuTxK/6u30I1AhiCcxWW36tYI5DXGqzKfZTnP3
         3AVM7ywCieooZM2BEIbO0CdP8WhsWJrDYzzBFWMYo/DuwTWzJAuvwvpFHsWiuFNjN2FL
         NFJM15mG/g5Pc7J4gFZFu2D0Ut8ypWEQ0lNTqVOCLQEQlkRZoJiVo2/5f0CFBhrN6ZeW
         +y7X99nO6ujyaXcWqk6PB5kM1gr8dv6PCD0U7zpwxDSiUIMoIS+VNqy2fQu+Dtd4mLZ1
         cUKMgbZGynSZKmKx19/kKe+K37YIhuXFg2NjzWqVpZT4l8XXxCLeW7LAmx0TkXuixyuH
         BGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754414396; x=1755019196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/FfZaSan1eV7HDF3Wa83lEa0xPcSUpZYrzYE5G9wjk=;
        b=nLumQjoRtlpm/tPwFOrB+Khcc0JE3esyLMfHZnw65R4dC6nA71uJ7JvS+uKJiYJvKT
         HyympFw71gb12t6zZjsT9xBnTmIqGxVjdtHj69olkVqVE5m/CQYGMiqlyv/7bw05JXUx
         4Vcwp+NrEL6n7qfDeB0vQ6X+VAqIcZObgr7aa6MM8vMaMmVXhNrkuJ1x0mreU2zFM+bj
         6qd3z/iqIdCISlMjBtVhAAwDeSYm8kwWhB2d1bKcKG5yaZiYE8t8wgq3PzE51Zoi9N1a
         mjIpLEdv2pQEpKD6c9lMHkk7vbXG4OBShPOMgqE6k2aSlptofo4SKJQWGsu94/xEiQDC
         gaVg==
X-Forwarded-Encrypted: i=1; AJvYcCUuIzMsDwEq0ZJhJRDac0trVIDX3xtFTHy9aaDXSZUuSfiwBR8CuBjhFhUKXK+G4R2GDmJklkGirZs=@lists.linux.dev
X-Gm-Message-State: AOJu0YynWNlmdXdDJQLBtWCZWqVqiENwhhUEHNitshj6nwNhhvs728xI
	VELpm+iedQ/G8wlL5SgSFQXNNhVRI5P75odHPjSb+JYXxXih41ZoTAfL
X-Gm-Gg: ASbGncsEng2t2c4v+lQlmHuB7CLr/L6sas/jO5dv19V0goqRaSJ/S2ULZWhQvebUxyY
	Nhy5hA4xnl/39UggE5q7/khyhUaHwCUhZ7PQyPTyWIuhbDcj5ic8+gOHXEchAWqbROXkEX8TTaY
	vqMsBxDfRxtqoQkoQQHYD1+XSjYswmLzbQ9GWncA/+flCoWiBv8+al9NGSsU1lge3uAvCuUgzjn
	JHLkLnyC/Lc+cHFdmtxcIjKydVEi9L7noaEdS10DO2UMehlLyU7J+nBAy2qKPcBpaD0PQ7Zo7db
	2Te0rpEUG4KHSXKSraLqhTgfRMNc/wzKVR7+RopWl2W3o++X+iGMA7rnyOEoIzeS8AoV1z3c2lH
	4z8p8E3WRsVWZbWC44Yzf30p0I9Q8
X-Google-Smtp-Source: AGHT+IFZ9pdK1jvsk2cxgalB1qSoH0zZWAWc/VG+Lc+QySUYQJ+aNEU1tTzI15MgaTEZ+riRKR17/A==
X-Received: by 2002:a05:6512:6d1:b0:553:2480:230a with SMTP id 2adb3069b0e04-55b979b819amr1540170e87.0.1754414396425;
        Tue, 05 Aug 2025 10:19:56 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a9483sm19586481fa.23.2025.08.05.10.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 10:19:56 -0700 (PDT)
Message-ID: <60895f3d-abe2-4fc3-afc3-176a188f06d4@gmail.com>
Date: Tue, 5 Aug 2025 19:19:09 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] kasan/um: select ARCH_DEFER_KASAN and call
 kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org, zhangqing@loongson.cn, chenhuacai@loongson.cn,
 trishalfonso@google.com, davidgow@google.com
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250805142622.560992-1-snovitoll@gmail.com>
 <20250805142622.560992-7-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250805142622.560992-7-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
> 
> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> index 9083bfdb773..8d14c8fc2cd 100644
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@ -5,6 +5,7 @@ menu "UML-specific options"
>  config UML
>  	bool
>  	default y
> +	select ARCH_DEFER_KASAN

select ARCH_DEFER_KASAN if STATIC_LINK

>  	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
>  	select ARCH_HAS_CACHE_LINE_SIZE
>  	select ARCH_HAS_CPU_FINALIZE_INIT
> diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
> index f97bb1f7b85..81bcdc0f962 100644
> --- a/arch/um/include/asm/kasan.h
> +++ b/arch/um/include/asm/kasan.h
> @@ -24,11 +24,6 @@
>  
>  #ifdef CONFIG_KASAN
>  void kasan_init(void);
> -extern int kasan_um_is_ready;
> -
> -#ifdef CONFIG_STATIC_LINK
> -#define kasan_arch_is_ready() (kasan_um_is_ready)
> -#endif
>  #else
>  static inline void kasan_init(void) { }
>  #endif /* CONFIG_KASAN */
