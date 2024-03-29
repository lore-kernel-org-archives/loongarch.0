Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F3A364D8
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711729983; cv=none; b=duV19n0+qxLji4xuWyN/Xpz5RiCuCpDDsqach7Irydm5UQaWpV7qYxS4+vp52hgoQVaNEEsbL/IRAgCZGw3csWKzrup++2PJR/IJ28lBZrXb2z7LF3dfF1/co0ZZb0vjwioJuQc8JNe9h08tLMBTnPnskC1FtaTA4W/ZyeDe/kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711729983; c=relaxed/simple;
	bh=oBGDDSUw8U47j/anO7FLiPybMp6BGFcal6P8LkTd1bM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=so0A9Cmd0oDW8CoSwykCH7tsxAp6Rijn1++r9lHe8m7iytGPywawGoY8MysnfvaRYpVuAhmJOOIsvEJiJwqwwLiPLAe0nN4c5n35aQATyK0ahO2SfFZTzc4umKgg5dQ5wD0YKmcG5WVkYHA+0nFPDFn/qB+KKuAaKOoKn0D50Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ypc3+YCb; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ypc3+YCb"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2a21af18037so258932a91.3
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711729981; x=1712334781; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oVniadOtylzye8e5zu9LavRkpC4RAr2fHGysUpfczOo=;
        b=Ypc3+YCb6ZX94VO9K2x0019tOZM3JevcpW2A1ZGJAT/fCdEGFIRhxIsvusgSpVzUMB
         jAp1Rle8WXVvGcAKw7QJp+Xi1aVoaDD1D2i+VtCAWWf+x8OlPg28br8XxxED73CpCElG
         MynxDFMeavu/A25p7MzBZD0bb1VE+00vIMJ8AbxKb4IsAcHU6/4teA3zLS31w9EUeJ8+
         d3pYFcvu1ZNpHt7wpVI9z5NR571SnkF9RMBBbPVbqAqPbxgz8sQ/VzvxQLlxr639SV9z
         6Pq/X9KrraaGfI/Q3KjPJ28eFuq4QFsvymhcCKbH15WAogYiPqulRPPfIESrfeU+kdCv
         J9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711729981; x=1712334781;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVniadOtylzye8e5zu9LavRkpC4RAr2fHGysUpfczOo=;
        b=XVuHAdZxWCChyQ5X2gSJaCprmMxRY6Nf7+RihX9u5dNacBUBge4S4dN7kInxRMZFLW
         5f8DI0mcH2bvJpE24vsdoe2WSQoaWUwExC633HPbimfYXt4w1ytr2kB9Zt2EReD5OR9q
         MAVIDJItEb6+vx4MhpvKXOJxZ9UlAEOQaaySePMvfdL2QXKPWOu/9N/N76kfppiV/qfT
         +Fc19dhzFRZvab1UKy1nJ1Xvdf1daCtXoi018TLLziBbcfs6JCIWI9K343P7MBOLsDMU
         D7hqAkS2fRHvuC8RAQi55oCuhTbyNwYvQGZm7FDV503paPSDEuaSNrULiZHfC60iQFDr
         w0Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWsueJQLAUnsbzWZb7fdWb+1OXN6jYLgFrrUHM3BVKyRSsE5CEr/fOnbkty/FW3V4IGs/3ARbl+j2lYNjMuFBLkiaQXxePdPbTP
X-Gm-Message-State: AOJu0YzApvPn+hjfp/CHuWrbEYmB2ObAEIw2K+eJZJljN15FaHesXIkZ
	6beqEpdbnrgTbVRZmIC/nbcbYhbYSAvUmuG2T89H0kdBuWUfS7WZey6wJ/o7
X-Google-Smtp-Source: AGHT+IHO777/ZH1b39xqLYwMYrBCLR040kYqbOmJ/UmU3cXpjnTbSnUfuy6BLdb+VzSShS92M76prA==
X-Received: by 2002:a17:90a:7f84:b0:2a2:d48:9d50 with SMTP id m4-20020a17090a7f8400b002a20d489d50mr2676972pjl.44.1711729981121;
        Fri, 29 Mar 2024 09:33:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ft4-20020a17090b0f8400b0029de1e54bcesm5386072pjb.18.2024.03.29.09.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 09:33:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0e754d23-b2b0-4469-8deb-2e42796b30b0@roeck-us.net>
Date: Fri, 29 Mar 2024 09:32:58 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel BUG with loongarch and CONFIG_KFENCE and CONFIG_DEBUG_SG
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev,
 WANG Xuerui <kernel@xen0n.name>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com
References: <c352829b-ed75-4ffd-af6e-0ea754e1bf3d@roeck-us.net>
 <4d2373e3f0694fd02137a72181d054ee2ebcca45.camel@xry111.site>
 <19c0ec82-59ce-4f46-9a38-cdca059e8867@roeck-us.net>
 <CAAhV-H7Po9B5WQMAUfB9jUmGAVit0+NiDbhV4jG5xKJUbWEBOw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAAhV-H7Po9B5WQMAUfB9jUmGAVit0+NiDbhV4jG5xKJUbWEBOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/24 19:17, Huacai Chen wrote:
> Hi, Guenter,
> 
> Thank you for your report, we find there are several kfence-related
> problems, and we have solved part of them.
> Link: https://github.com/chenhuacai/linux/commits/loongarch-next
> 

Thanks a lot for the update.

A note regarding the patches in that tree, not related to the kfence
problem: I don't immediately see why the hwmon driver should reside
outside drivers/hwmon/, and hwmon_device_register_with_groups() is
deprecated and should not be used in new drivers.
On top of that, shutting off the system in case of thermal issues
is not the responsibility of a hardware monitoring driver.
That functionality should be handled by the thermal subsystem.

Thanks,
Guenter

