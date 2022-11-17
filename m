Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D409192
	for <loongarch@lists.linux.dev>; Thu, 17 Nov 2022 00:31:19 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso416712pjc.5
        for <loongarch@lists.linux.dev>; Wed, 16 Nov 2022 16:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bfYTHCNCtdWeHJf9pplhisQ2FfqYgZ1s/D8ukZJ0aF0=;
        b=noLKefdE/A5/nbmTvR6mJw3cGxk/a7fIL83IBp5Ph1Sax30+McHCvDQ9202nLf5uce
         hPc2gZOe0LsvudzlGDyBmEAgwDGtCwPT27+S6nCdQzTHR81ueFyHGEG25Bj0t5HJUYw6
         csu11i/pEoPga4S6lvqc8FbzvURZMsHN35+PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfYTHCNCtdWeHJf9pplhisQ2FfqYgZ1s/D8ukZJ0aF0=;
        b=WSm7cDtBbSNQJ5NQOBJT7pgVYlqpLoy1RTRKHCckIOwNn90cx80EJ3wcVYX1FZ7O26
         euVZzEAisih3jXhtk7eNU8o1+jf3j4W9y7HovRG6icuRLVsgdPrH0dkdvyuqcP4/pkgd
         g0zeKisR004SV8lEAk4QkSF3XoW0JzSkUJLyhLe7+Of+mGMvDoIHqt/Bkd01w2Yqu+Mz
         5afy106eyFLPJNndZWSMvKAh1xOWjfZ94ktN9s/4/pVC31nVNJISkbgKn31G6U+2IER0
         GnAs4ofpuSBSx0zr3GKFFHnFs+DyhpcBrt5+tQBu8XugGhanTRgiq9ji0emCBuT1N/Mv
         LkIA==
X-Gm-Message-State: ANoB5pldfgs/weEU2l3nLLY3Sk1muY6gEtLOok4pcBdMyt6tkVXl7KLF
	IFcQ68jkKnueNqXSGInev/KOdw==
X-Google-Smtp-Source: AA0mqf5LCeBMlQYf9iRokqtAPq5JSpm9R+EnXlxq59oA8dqbtgC+he2PCZJy9QgLdGN/YL6SFM4OFA==
X-Received: by 2002:a17:90a:6949:b0:213:188c:158d with SMTP id j9-20020a17090a694900b00213188c158dmr343097pjm.11.1668645079035;
        Wed, 16 Nov 2022 16:31:19 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s1-20020a170902ea0100b00174f61a7d09sm12946657plg.247.2022.11.16.16.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:31:18 -0800 (PST)
Date: Wed, 16 Nov 2022 16:31:18 -0800
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	"Darrick J . Wong" <djwong@kernel.org>,
	SeongJae Park <sj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
	netdev@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mmc@vger.kernel.org,
	linux-parisc@vger.kernel.org, ydroneaud@opteya.com
Subject: Re: [PATCH v2 3/3] treewide: use get_random_u32_between() when
 possible
Message-ID: <202211161628.164F47F@keescook>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221114164558.1180362-4-Jason@zx2c4.com>
 <202211161436.A45AD719A@keescook>
 <Y3V4g8eorwiU++Y3@zx2c4.com>
 <Y3V6QtYMayODVDOk@zx2c4.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3V6QtYMayODVDOk@zx2c4.com>

On Thu, Nov 17, 2022 at 01:03:14AM +0100, Jason A. Donenfeld wrote:
> On Thu, Nov 17, 2022 at 12:55:47AM +0100, Jason A. Donenfeld wrote:
> > 2) What to call it:
> >    - between I still like, because it mirrors "I'm thinking of a number
> >      between 1 and 10 and..." that everybody knows,
> >    - inclusive I guess works, but it's not a preposition,
> >    - bikeshed color #3?
> 
> - between
> - ranged
> - spanning
> 
> https://www.thefreedictionary.com/List-of-prepositions.htm
> - amid
> 
> Sigh, names.

I think "inclusive" is best. The other words still don't provide
unambiguous language. It's the language used in formal math, e.g.
sigma-notation, etc. It's an adjective for "get random" (verb, noun).

-- 
Kees Cook
