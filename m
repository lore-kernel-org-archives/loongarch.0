Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4490518785F
	for <loongarch@lists.linux.dev>; Fri, 23 Aug 2024 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724414340; cv=none; b=MorjTAVdwVaTUwU1bRXjItIsP/YJ+OQ6oZSnUKPKzO4yXK/fDsboPDkiWaE8jRJa/pD8CfE+vvc6jRP5vJRkPcebu9I7nxvyn5xn9gSDSvFv5PRqyqtMj1t4xXJA8XYaOsHgB2hgvbhPabE2jfqx3Ifw4XwO6HfUnBN7okOF18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724414340; c=relaxed/simple;
	bh=gOuGLLp2dNTeHW8uT+dUzwnOGJ7gbf7VhrhQyr4Xe6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cD/lomHc4ut3HQx61kb0r2XQ1j2LYW80t0TkZ0BxOIXn3zGG21RGk67X4GPYE55E6jizFF7Fsu1IoPw73fcdQMUYb87WGBgC4TSTRhZ88MrZ/jGTyMqKq3MkSDaiMF60nwM2p1xlGRkVz3lWjxGDJsAfdJwBkoastnsYozMcwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-498e40756baso669405137.1
        for <loongarch@lists.linux.dev>; Fri, 23 Aug 2024 04:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724414338; x=1725019138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOuGLLp2dNTeHW8uT+dUzwnOGJ7gbf7VhrhQyr4Xe6I=;
        b=kat+O4Iv95OrwFAgy3WmTc87png6E6Pv1KUTQ/6YwQZLtGTB+HR9pooYSTq0Eubsdg
         naPy1gcox4XkJyb6vcpYnPqPZDYCLAXcMeKSraj88PpNdGleV+E+ASt/YzD7p5PdMdpA
         cWnomHyXvZxKEWm3nBYhSDUjN1D+eeNVWRuLLx663P8DZUHuDrFbbEIiWGdKnZWDIkOL
         rIZ+7dULcBRm9gvonHBWaQI0cGoFcoK+7GNVIc0HJrWtwe5DC4Z4xbffDJfvVIESzQ4z
         BE1xs/GFT2tgk9y/IqWf+w3Jd3lXydCM7v1+1ZmKa0vaVVfYq+j5vhGJwWZoU3euzYQm
         9BHw==
X-Forwarded-Encrypted: i=1; AJvYcCWiOyJebJJ4NorEO5hh0UUAM+DEL6IKXiL9w5Acj+XmxemqC7LbWfuTiVHYIzEcx9DnGZKrDDGxCc8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzB6Ql+CyACIqJR2Zs6uVPIuh7CbgOEup5wn5N/WomYellCnwLS
	fvxrCDT3Ld1dBH1VvNsuebamczlXLnfx0fPBQWn13OyFmU2Tu1cF
X-Google-Smtp-Source: AGHT+IGTnsj+vzaB6DUYSRe4ILJB8y8mubsJfwnJ5TjC90dt1P9FzBdqUNam7n18s/aSRrNdBhBpzA==
X-Received: by 2002:a05:6102:26ca:b0:48f:40c1:3cd0 with SMTP id ada2fe7eead31-498f4633bafmr2258426137.12.1724414338017;
        Fri, 23 Aug 2024 04:58:58 -0700 (PDT)
Received: from [192.168.2.219] ([65.93.184.127])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162d6db58sm17621556d6.65.2024.08.23.04.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 04:58:57 -0700 (PDT)
Message-ID: <dc4a1941-6671-4e89-90c2-3a1c19fd3e1c@vasilevsky.ca>
Date: Fri, 23 Aug 2024 07:58:44 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related config
 items
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 kexec@lists.infradead.org, debian-powerpc@lists.debian.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, akpm@linux-foundation.org, ebiederm@xmission.com,
 hbathini@linux.ibm.com, piliu@redhat.com, viro@zeniv.linux.org.uk,
 Sam James <sam@gentoo.org>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-6-bhe@redhat.com>
 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
 <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
 <c5e9996e4d2ba2a0849d65f68e3dce94fffc5828.camel@physik.fu-berlin.de>
 <ZsfR9rdMt8yn1+Bz@MiWiFi-R3L-srv>
 <768dfe3e-c437-40cc-96a5-6c5b34b2d19d@vasilevsky.ca>
 <c74e24213fd98b252a2a1ff02a107005e50f4f7b.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Dave Vasilevsky <dave@vasilevsky.ca>
In-Reply-To: <c74e24213fd98b252a2a1ff02a107005e50f4f7b.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-08-23 03:16, John Paul Adrian Glaubitz wrote:
> It should be disabled on m68k and sh by default as well.

Sure, I can change that. What's the reasoning, so I can explain in my commit message?

-Dave
