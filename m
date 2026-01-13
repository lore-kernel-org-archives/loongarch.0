Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2427D38BDB7
	for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307609; cv=none; b=IJC8cBAy8/KyYUj8UKv/S0I1yd7zrK2af+cJHwE8NGEAXIoMWePv1ouKgNackiR9gdbTQ4aIgHno8cAEAExSUZwUpTDQdYX4bU9VJVZKej+SUBwRBKLdQk6gQbjTqxFelt6BnoShNoaoX2B4KTF+HEYgsBrm3sySePDJX/ZSiiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307609; c=relaxed/simple;
	bh=c2pQGNsmx4TXSTG4ks/OmiO2LMby6F7I6nhF1Yls93E=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=Xqd8Kb3p2nlZwayjSD7AY+g397xryqhhrHhmcFzduXidogj518A9LIgVpI2gudymEgkBlyFMLzFByXeIKJagNssZmPClhxWYgl5rvCUwsD67/ldUp4bmf4cjuLcxD2IbPK9YKQe1uJduHY4kc0ir89kFd4Pi3FSABg5iPS52j+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfIRVRLk; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfIRVRLk"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c075ec1a58aso2896275a12.0
        for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 04:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307607; x=1768912407; darn=lists.linux.dev;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4BCb4tuwUydlXX/lekB/MWAbo5xTWmBY98lhxIZgCk=;
        b=kfIRVRLkePBfE+q0ikawlM58nEPhYIe17Lt87K9ZpYq6aecYkWYaQhQtJjwtt112qJ
         yD47JtgtIPQP6h5z1Iha1yrqzZ48wNbtMnXwr8TXEDea7FYzxfogh/HkhvsOfo/Prn5V
         Hr+4Zy6DjczhSabLHSrvbzPV/2WqXCs4HJY8i0VWA7rfKoXzU0+MhCS8zcWXCh+FuEct
         kP1jRsViNvUlSYmgM1TQV8XytsbQ5uQ8YZLbFURm6Y7qmXRUmug9U7k1osV21boobRWQ
         Asc7Eb+T20I+493f9vZmmrA/v8OqtMZ+PZVpVOcJkpYZaeV/osdk2lCTam0npbbsRXrk
         sWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307607; x=1768912407;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4BCb4tuwUydlXX/lekB/MWAbo5xTWmBY98lhxIZgCk=;
        b=DFg9eEm5f/ipY8oxg8k5utng4mPodza+Bg6Rlhnq/dPCGFI1GNyeL+bD1AgT8FKj4/
         849iQAOovm9QOSwHUKecZJTB00ITnzQU55QJl6pwIRIMukMLixuU7lFsVF8m6/ZjG9yN
         VTgRbvx07UPfb3XNeMbaevTKZhZD3rq9VQ73TEvDZGYyXjBKOHuz+yJWQq2S5DEKDZ46
         5CQNAVYNvAqfAIClzG3yIQ528pnVoifrLrNKAxH924O/cxUkWFou3keEJb1OaLaHSNhR
         67X04o7fipyQ2W0HaltGjDZtDyu9j23xFoYAMJ15z5UgYsR/eG6XdKnap4iH60fM52pM
         GtKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXomKVpMWgq8map3dt83uP+yj31tZ1ANxY0vJiAYwMuQptzplKz6IU4qU6zXcR1zZTG8hhHM/yEFng=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYtZYUDf39VX0s3Q2AHPt3UISmwZUa4vzvG9bqukEhTGQk5rKR
	hHOdP6aHHwCdcUtzroWTCgQ/GX1hn7BVmcmjfpfMhbd/hVf5p20XwSjz
X-Gm-Gg: AY/fxX5OdAwpKtLjk1nnCo6M2bHy/P1WTbw/ms1oqmTDDKxxo7IOnUPa5FWtS3giWAr
	/H4gLj8t8MxXNrewcwIct5kybk6xihdV06nUNSMi/f7/xJrxztCgGNd5jSadk3Z4ZngdAIvpQz5
	GnF6v6+PpIs/VV4eBxENsLC0sH/fehbR9z9P6HbYe5uascRYSb2+ngf+CBk+5UQrfAx/ya44/0F
	XLoqZ/LlqlQd58P1RxA/Use4Ptbgx4vBpbRsN+Kna0uhxTNeB1LoWQyInqIj1AADWMoSMfsFMsK
	hCyOipr9BYgaSzYyW6+dkIxNU9rxUfAqk1Y0yLY1hl7g9YMMOHNeNyoDs3k1DU/BvgAAKKI0HJd
	ytLLWPR2/Q0aN5EBraKqLLobE1gPrP3q8htaLRS87iX8BF8YkBLVlKHWcIZPQ579qChu/CpNbkS
	yV75VC
X-Google-Smtp-Source: AGHT+IFw8NQUhXWsNFLNcy9VnhtaeqSccMp4bageDierszWlx1Kxyih6osyfD1+uAcqTN4o2oK4SYQ==
X-Received: by 2002:a17:90b:3ccc:b0:340:9ba6:8af4 with SMTP id 98e67ed59e1d1-34f68c47f0amr18570023a91.35.1768307607428;
        Tue, 13 Jan 2026 04:33:27 -0800 (PST)
Received: from dw-tp ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-350fd6e343bsm1428958a91.1.2026.01.13.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:33:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	Klara Modin <klarasmodin@gmail.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 15/29] powerpc: introduce arch_zone_limits_init()
In-Reply-To: <20260111082105.290734-16-rppt@kernel.org>
Date: Tue, 13 Jan 2026 17:59:49 +0530
Message-ID: <87zf6hu24i.ritesh.list@gmail.com>
References: <20260111082105.290734-1-rppt@kernel.org> <20260111082105.290734-16-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mike Rapoport <rppt@kernel.org> writes:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
>
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/powerpc/mm/mem.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

This v2 looks good to me. 
I have also done a basic bootup testing using Linux PPC CI.

Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
