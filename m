Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615CA36921B
	for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 06:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768287054; cv=none; b=gi5n+hIjz9oBZIwiNcege9LKCHSaGVo/wOD9rKUyRGEA0SGaIMEFXEyAGNzh/T/euFdPqLhQhVpPUVImSm3YAxoWXDQGY2LWIIELQeJrJQtngo7BoShZvv12iqr0AkiZBo1+OAjd3sfXaw07FyHwfazEj50GtqYgjQ2QvDHbbaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768287054; c=relaxed/simple;
	bh=aDB3sdHl8yEvBSscr99tVhZre5iBP2s4Ktcd0fugEGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWIye15Z8VMFAsJ557EQqfdANiJhMGp3WkZcxM7TTnHoHlxEkgJ87D97a/HOpTSDetf4OAppPqEVjkpr3j4Arjm/HyAiI8xvGFp7X3g/QcJjQ3lfxH4JVt/aO2G3b2X4HEk5KiYXijm5VUUDRWsQaMJj3QcRJGUYRl048lH7ZBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOPekCbm; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOPekCbm"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88fe44cce7eso56304356d6.3
        for <loongarch@lists.linux.dev>; Mon, 12 Jan 2026 22:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768287051; x=1768891851; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vX59/flKMUDb8zjb/CqTAfKlTuGyJwgf2lJ9POWv81Y=;
        b=MOPekCbmOrh5/OaSIz3ALiWEuhkN0LBbrlE8+c1jadiK1fGOBYuir3WMAPTVpLOZNx
         PWKPAafT/UlytzB/0lpQVRF7k2SiVzYO6REJxribSfAZm/0MT0aV4LSrop2S/e6ZUJQp
         YH9GpJsJi4QmOYdV9/Vl80VBMjzINy4VjaW97pB/4SmCk3xeDTDbAZxAx/cOilnNAIq/
         9JlZGALFQ8Wh9ZkAziLN1i0/koprxJyXrHIE0xbYWW1SK0uaA+TojZeflsDdOaUI6d2f
         +NOtqkHy6Pr4hihArDMWd/3nPOoV8HMXFuV0BpmsT8WmOun/59SCkInaFckzUnrjBai+
         EGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768287051; x=1768891851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vX59/flKMUDb8zjb/CqTAfKlTuGyJwgf2lJ9POWv81Y=;
        b=Jy/L9UPJE3d5O3sdLg5Su8ovOEdxbIzyz8cBLxBUTFvqYW7OCzbWKaEwfdw6Z08w9t
         Z6jXoS0RWADgxT9rerJ5G4i6tS2GcsHzDBZT1AcOKFNvlWRlmfQBMPcJig2M0OBKcvWR
         4mfSbQj2vX8/7uIEryJaR8mP4fhIPvPbBsFYoteMgHtD5o/wjDrG/XxAai1JWklocvmr
         ZrpLVybWAANOefENmqKGpRsCDf0gbG0r99x4C5nx7Se2CJ6/6r49Z/SbrqR9akpDCswp
         tzEWgxjvEhyjPbuc5p9B84wyHSNTekFOpI9HE3UyfomR05j8UEKE+SIR4Ilf474lURqU
         u8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgW8XQ/Cxg9y2szxkVqKVEUYjUz5tWqppEVRmxohfERJf+m2SWr0Q+4i2Rd8daGCczDsfZJpJMJEw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP207OgTQlHJwOpUfpoAOBWrd042/2U6S8o3+CZ8e7lXqHmzJk
	ldfAbeN2XN9xoR5F/MZFcKqln+zUagIixf8Qb4a86FXNarX4voh9wYEf
X-Gm-Gg: AY/fxX7NciVyFcm9GKspRmBEqYgJklZM49Zh0+ZQsguLGdxi+wRscXJHoyDZqKm4XRR
	LkJrnyTQHTMhCCbYMKK5JPb9v2iN/swnWuaDnlV1BMjYkPBJKSsdlZZJT/sfiJ/ARAQ185UF7sS
	1MD8XxnbL6oVn6Mgd0JrK6OaBRGkmmwWgdor0wBAkkF6kxVm50xYSrqAcqldk7CidCrv9UasWdl
	tsSlt8W31QzSuIdIs+vX7F9h/oZrFLNcHPmyKGNBSAM5T6Zqy4p/BkltOw0IyP9JzxQwkfJYB/k
	1ypkNntoqWmgIJvRenfer5QuLg9wkksVbdibAJviILqxUipkHFB76fNxtIrRsoxCvwEY5ETDXkQ
	bxl91/LSlaCZQKvkKHUvlCi3qCLkb25FkFKv0zDXQNHDiIeer+f0GZpoOwB/q1hgym0SDlaNjAM
	i/T0368pboUbzryqCnm12XUOPcelrTAlSY/dPtMZky752U816db3W76EY6Yg==
X-Google-Smtp-Source: AGHT+IFA85MjM1cnTGL5nks8UTBaUTRvSeGOw/MqVWENdA/8we2okwkLgNeF33lCoaLlOIlw7RP7mg==
X-Received: by 2002:a05:6214:4291:b0:888:81f1:a05e with SMTP id 6a1803df08f44-890842d1be9mr273660036d6.60.1768287051243;
        Mon, 12 Jan 2026 22:50:51 -0800 (PST)
Received: from [172.20.10.9] (mobile-access-c1d2ca-216.dhcp.inet.fi. [193.210.202.216])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cdfb0sm152433806d6.6.2026.01.12.22.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 22:50:50 -0800 (PST)
Message-ID: <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Date: Tue, 13 Jan 2026 08:50:33 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
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
Content-Language: en-US
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/13/26 00:23, Andrew Morton wrote:
> On Sun, 11 Jan 2026 10:20:34 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> 
>> v3 changes:
>> * fix empty_zero_page initialization on arm
>> * fix ZONE_DMA limit calculation on powerpc
>> * add Acks
> 
> updated, thanks.  I'll suppress the ensuing email flood.
> 
> Kalle, can you please retest sometime, see if the BeagleBone Black boot
> failure was fixed?
> 
> Seems we haven't heard back from rmk regarding
> https://lkml.kernel.org/r/aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk.

Hello!

I will test this v3 patch ASAP and reply results here.
Collective sorry for the delay; I have been busy!

BR
Kalle
