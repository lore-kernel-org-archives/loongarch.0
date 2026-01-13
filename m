Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3C1E8826
	for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300293; cv=none; b=RJOAImFmoeXkCCUsHmw9XQZyYf3Pxgl/mcWRRUgRVKsb11aTBH9KGicEpnwLDMy5uUoBwnv7ZAZkja5nHjhkpg/+jWY5VZ96FAeTYpMpfX0VoLl+yvK8WhUI+0KMwrE1bQqMOLj/07VAatkBNwkKj/N9CNrwBuxG8SrUPsijAwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300293; c=relaxed/simple;
	bh=39NtxAeqpXvhawaLycQSgS8a7QXmm9U/xmb9EyW+PGc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=K9JwK4ugTMJ5jOzU4CyEpKVuanMjRGNjTD/jqoEeZjAbfdSTMpoMqwcecNR4Hk0kiIZIIQ/imk02fBvHir77yQ7JkibIbUgioBRKqx6iOJ8vjl4wxjSO/fLEAr3jjFepNGMoC0Aeb8F8incy7w6uNXnb+iRJDL989D4os9RTae8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/tapHYt; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/tapHYt"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-382f4aa8dd1so57157731fa.3
        for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300289; x=1768905089; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=H/tapHYtcML0nwcKG9sH0PfwUYBNYgv8AM4J2cdWD4ZrAcwfDWFPcH2UzbSmypKTpL
         k6N5VDMLsV0HbFGKIbYg5yQwFIA3K9Q/XSz4/Qt1HtLH8CE0f9rSYNxKTp0HwAodMXQT
         9AivY2bwc+7ksP9rdu/f12Wb2WOT90tTeqlTDONsnpfFYeJG5JNOuMGfTcl8gsV0csek
         NmNC9vRKN3nrdZuLOar9kjXO0Z0EvafFvz3bd/xHTqfdwGA9n0dUlqk+CiJ+aIGcEl7N
         x5G84lUYrEWUef+Ivdsp9WdiW5O+FQ6Ueqg0RFsauCNsquoBC9vxe4XNnFURtp6KL009
         EsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300289; x=1768905089;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=ZiJtTkWlAsVdNa48X3dqluQzoVxt6n+F/Zf2jda+Sajqq/uO9D61QOugKZ1XItaEx0
         Wko2M0LskVZS33EG/b6nv28sgt8Ghwvuw5mlyLFORdVtUC869xi5XErPWAIEPdrsIjtA
         Sd5Assx7boII8W9it2b+K9HGEguPRcnJhpsocaimx3fIOm+VBspI3sE1rg7wl5p/5LzB
         hHcW7pirUmIvDOBmKNLzvFYCOJiGPpUEUigHUa7lvlxss6uOFUsisF/6ZYeRxJvqeEj3
         I4LE9jY/4fwl5A+boez/buvG5XX9bggE7jt1x+xjPKsquxiRROiPShUwdRgyUk3W/zfw
         wJHw==
X-Forwarded-Encrypted: i=1; AJvYcCU0CHRnj+3JhDmeozmzWGhtJ8SxJRjuXfaagCErdNIvJm9Yz52yCYeAkC/eUtCyzpKgpytOSV1Jvoo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzErvguC/3FbisOo/lNqzaB9OCYf7m1ccv4jcLomAS69H4DtrAx
	v8Floe9mrGp/xaf9PWbP+fwwvV2ZgHXs/wO6L1Uq3osSghhGIH+Jv1MM
X-Gm-Gg: AY/fxX7/gpWQbt6szS3hEy8X8wGJwqLU9bOcxoKo55eSU9FSheEsY5aCma74pxKG8hC
	8kS7wvrMCN0D1MpCmvHYXR0jIU6NcoZ1CRN7t3fJroEuPelsrOq42Xo9qDJ+I9PAReePLpEeaT1
	TGnx00y7x+K5Mbq2KER96yGnhTsX7vKXQU6nodVEUiXUaSvglowABXmY2A0Fp9IUxBNvPNJ3O81
	i7YO1ORAyj5lMzDa7TmqD/Undrig4nEAo5BH2BJvpGlOXSW7n6LXPoluH/2xj6/FDjqlHBvgk+w
	8eKwVnoP9jE9+BogPz7RIJaYO32FoCIy9Di8Xuj6LqT0XxnbKPUtu8drX3CVKYmvroEl4ZQ4q8P
	ZgXWQ0CIFZ9svgWjldcIY7eXgAGYKK2SIYopR7YLdTS9RdFn6BYyPdBn19ikMwAPcTr90pC27y1
	Iwrlj+WtipxINbJcG12hL2miQfbGeOEin0OHJKv3+j4cU7VRemsnBEQWaBKA==
X-Google-Smtp-Source: AGHT+IEOoK2sWcGzQ5k4NJjsFR/RmdeWAB9vvZrFfNJ0u+S6dsEFK74/fdYnqiqEV2XmHMt6sJ390w==
X-Received: by 2002:a05:6512:138b:b0:598:e851:1db3 with SMTP id 2adb3069b0e04-59b6ef05760mr8236951e87.11.1768293628066;
        Tue, 13 Jan 2026 00:40:28 -0800 (PST)
Received: from [172.20.10.9] (mobile-access-c1d2ca-216.dhcp.inet.fi. [193.210.202.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72f3ae82sm4416299e87.71.2026.01.13.00.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:40:27 -0800 (PST)
Message-ID: <f861a1c6-7ec7-477c-bc42-f9aaf6724bed@gmail.com>
Date: Tue, 13 Jan 2026 10:40:22 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
From: Kalle Niemi <kaleposti@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
 <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Language: en-US
In-Reply-To: <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/26 08:50, Kalle Niemi wrote:
> On 1/13/26 00:23, Andrew Morton wrote:
>> On Sun, 11 Jan 2026 10:20:34 +0200 Mike Rapoport <rppt@kernel.org> wrote:
>>
>>> v3 changes:
>>> * fix empty_zero_page initialization on arm
>>> * fix ZONE_DMA limit calculation on powerpc
>>> * add Acks
>>
>> updated, thanks.  I'll suppress the ensuing email flood.
>>
>> Kalle, can you please retest sometime, see if the BeagleBone Black boot
>> failure was fixed?
>>
>> Seems we haven't heard back from rmk regarding
>> https://lkml.kernel.org/r/aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk.
> 
> Hello!
> 
> I will test this v3 patch ASAP and reply results here.
> Collective sorry for the delay; I have been busy!
> 
> BR
> Kalle

Hello!

I tried this patch by cloning 
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=hugetlb-init/v3

Boots succesfully on BeagleBone Black!

BR
Kalle
