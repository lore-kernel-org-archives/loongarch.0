Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57094D30F
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 09:27:12 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685524894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zEwS13PweNb4v6/q/yHlwEjWehGeBMGdh97AiFB1MBk=;
	b=HcicfrKIFFQnGH3RCfvJPoHcRCGwwGXryIMvN71dgCKi2BhyIRiFUABc93u9yqOo1sB9ej
	NlGV/jm2Mesg8yptFTp1yG9DbSuXDKFEHWcb/sRRjkgtvPSfPEKjUG4WysLijCJAoenf0U
	wsEv5PsmHZGQOojgb1Twx5Bl4zGmEWKh9yExXgVDrClVgyMNWybcHrQdJTSWD5/PIC98fr
	BOYO9Iv2jVEYZCXKKl9ySSrDeF0l1hqfRXmMpZbSy1hHBl9X3RkY5R5X9fO5E3rvHuUyit
	AqHi8+PuakteXaePX+WwDDUC3LpNbG8DOxQDkkWrxhZb+7SKHqNv+V37UReNUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685524894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zEwS13PweNb4v6/q/yHlwEjWehGeBMGdh97AiFB1MBk=;
	b=9+o7sNoVuKLWRnNsTH2s5Pg/UFqC41oelnZZyTL9DNKpqy6u4FdTYndLn6MnIXsZB9Y9c7
	okMBQMmoK2OpsRBQ==
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Christian
 Brauner <brauner@kernel.org>, Andy Lutomirski <luto@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v3] LoongArch: Add support to clone a time namespace
In-Reply-To: <1685519761-20425-1-git-send-email-yangtiezhu@loongson.cn>
References: <1685519761-20425-1-git-send-email-yangtiezhu@loongson.cn>
Date: Wed, 31 May 2023 11:21:33 +0200
Message-ID: <87bki0hn4y.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, May 31 2023 at 15:56, Tiezhu Yang wrote:
> When execute the following command to test clone3 on LoongArch:
>
>   # cd tools/testing/selftests/clone3 && make && ./clone3
>
> we can see the following error info:
>
>   # [5719] Trying clone3() with flags 0x80 (size 0)
>   # Invalid argument - Failed to create new process
>   # [5719] clone3() with flags says: -22 expected 0
>   not ok 18 [5719] Result (-22) is different than expected (0)
>
> This is because if CONFIG_TIME_NS is not set, but the flag
> CLONE_NEWTIME (0x80) is used to clone a time namespace, it
> will return -EINVAL in copy_time_ns().

Which means that test case is broken.

> With this patch, the following failed test can be fixed too:

You cannot fix a broken test case by enabling functionality which
is not guaranteed to be available on all platforms.

Adding time name spaces on loongarch is a completely separate issue and
has absolutely nothing to do with broken test cases.

They are still broken when CONFIG_TIME_NS is disabled in Kconfig, no?

So this wants to be two separate things:

   1) Fix the broken test cases so they handle CONFIG_TIME_NS=n
      situations correctly

   2) Add support for TIME_NS to loongarch

Thanks,

        tglx
