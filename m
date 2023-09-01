Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D03120E1
	for <loongarch@lists.linux.dev>; Fri,  1 Sep 2023 17:30:57 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-77acb04309dso81407239f.2
        for <loongarch@lists.linux.dev>; Fri, 01 Sep 2023 10:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693589457; x=1694194257; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7Ic2JgCifJ9BR0gJc8OX6iWRD9HNnkepfgcfad3kDo=;
        b=D/Zic9+BPZozSOLhmkm82U/ZC8KtdYQIih6Tnk5uEViO+mMut37N6jQ1mryRg8d8Ht
         en3iAo7OKosEHVc0ZB0Ys0QfKvBgzPT/PC0y+YMVKN1A+jUp/1qXvpRixnF5tIximU6d
         V6CAAzBjGq4eXCM03i1q48kVt6kARY7xPVsTdoupcV2/LBLZNX6p8hBmT68SSnTLARgk
         WyUa8TYbQcnoktywr+44Sqc1TXmbFhnzuisFF4v/e9b3Yu1HMOhkGcUBUJq9vvSDSwVB
         e+cbSwbG/ffVTIkl9N7L2yZlH0bJTEQ9DHqa/rqZqXCWy3oxpktyu0LihSlbpCO4Cv8i
         myPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693589457; x=1694194257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7Ic2JgCifJ9BR0gJc8OX6iWRD9HNnkepfgcfad3kDo=;
        b=FtHItJfOAdDLnYrpUvKVj3pafgqoCaCfvjGCnQheoCKX8urX06lrzvpEbOn9N4tz4b
         K3JRuLSQk6X1WVg9auihDI7NvI1nCXeAInUOR/FjFIxNOnuWC5XD6/qS5So6S+s0FFIZ
         0BihQvJlc8PYg1hm2PCK9uuxQ5PtMh0WFbDP9e35bqLYbiWJdGPajvcyVb1uWTFLkp7L
         lv/6QTxzshLgf0Dl6PLw6qMDo54qjAoOt2cOrsqRplRJ0BIak6wuI58vX2lzXEbMXrGf
         dMXpJ7/JfjVWW6fs7ZaumKLu0dCaJOwb+7BnhlrShpxN4J5ZXv8Yh+koUNNr9Mw5+atH
         1+wA==
X-Gm-Message-State: AOJu0YxDxa99VZSaTlvnFJ6m8CXhSuAhwzsrW8PKIrCPHVBkdD7o1UQV
	bAjxpAhzWVT9xg/qIx5FgVY=
X-Google-Smtp-Source: AGHT+IG60rEwPMClyUpLxgIkdetUrkTvd12OeZpQuEmA5mPuJPh251Y1toBygAxAyHVb0OiLVFUbUA==
X-Received: by 2002:a6b:7f46:0:b0:791:2db5:c779 with SMTP id m6-20020a6b7f46000000b007912db5c779mr3826112ioq.10.1693589457075;
        Fri, 01 Sep 2023 10:30:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f23-20020a056602039700b007836252a084sm1178665iov.48.2023.09.01.10.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 10:30:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Sep 2023 10:30:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nikolay Borisov <nik.borisov@suse.com>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org,
	Richard Henderson <richard.henderson@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chris Zankel <chris@zankel.net>,
	Tom Lendacky <thomas.lendacky@amd.com>, semenzato@google.com
Subject: Re: [patch 17/17] x86/fpu: Move FPU initialization into
 arch_cpu_finalize_init()
Message-ID: <ba1b11e5-b3f0-457b-8920-d57d470626c3@roeck-us.net>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.902376621@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613224545.902376621@linutronix.de>

Hi,

On Wed, Jun 14, 2023 at 01:39:46AM +0200, Thomas Gleixner wrote:
> Initializing the FPU during the early boot process is a pointless
> exercise. Early boot is convoluted and fragile enough.
> 
> Nothing requires that the FPU is set up early. It has to be initialized
> before fork_init() because the task_struct size depends on the FPU register
> buffer size.
> 
> Move the initialization to arch_cpu_finalize_init() which is the perfect
> place to do so.
> 
> No functional change.
> 
> This allows to remove quite some of the custom early command line parsing,
> but that's subject to the next installment.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

The backport of this patch into chromeos-5.10 and chromeos-5.15 via stable
relase merges is causing various Chromebooks (not all of them) to crash
early during boot. Subsequent fixes have not addressed the problem for us,
so we already reverted the patch from chromeos-5.15 and will revert it
from chromeos-5.10 as well.

I don't know if this is a Chromebook specific problem, or if it affects
mainline, so this is just a heads-up in case others experience similar
problems.

Thanks,
Guenter
