Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAF814D43D;
	Tue, 24 Dec 2024 06:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735023109; cv=none; b=Sq44+Umw+hlP/998mbMLjWKmuqfHPa1BuqgqwQttlcWRN6udBAg0NePY1J5iAnm3m0P6X/6mXoxtb4jrvYyJU/KOFku/0p3BAcLNiPKwx0BKMNmJDrfDXvugQJepJ3WX4LNCv96NdD+n2SkjVtK4MlC7+px+/vzAGdbgBo9ferk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735023109; c=relaxed/simple;
	bh=ziqgA+4cQyECAcPibuRjTjPwIwUUuJchTAYtrhObgG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgfZK+QyL2X1vEhIDaJc28Eq1RKsjHcyyZ35E1dOWXpnnWy2ZJG+pUoG3Pf9CVe6oEE3LpYrsuJU3rl32ESl7njjgv3UaJbqrAQem782gYwawvpo3bYPrB6L/V7L1axoO8Sn8tDe5PVMDhP2gJdZC6jXd/HuzC/bTkk4xOB25vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2l9+wDf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2l9+wDf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82464C4CED0;
	Tue, 24 Dec 2024 06:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735023108;
	bh=ziqgA+4cQyECAcPibuRjTjPwIwUUuJchTAYtrhObgG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2l9+wDfKH5Sy/3RTTReRB+k4AXnFFbn0JGXhnhvwxjZGRy5pOWINChNGRxZtKTSp
	 ZWu7isB6yuSpu4/aPRTAvez5dciTYg/lJZl4bV1OPCUpxFxSrlpzFwc/Ty124IFHva
	 cqkk1f9tgNRVTIvs1ZzukpajMBkPiuGpiOAE4QBqxQxc0sUMIsoW6N8XxZBKZkjOo9
	 z5stvhnspV+Lfbfni/uknKrEwZZsCM1OY6S+lYQlS7HKJaWKJS7rSVyzm/LlBLo7iF
	 8UOabiFet3EeDnxvxX07SG00jVFBhN/wJeeoZbriK415a3ehF7Yp+JhYEeHDfMLyrF
	 ae0VoAYuUy5IQ==
Date: Mon, 23 Dec 2024 22:51:46 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: wzs <wangzhengshu39@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-parisc@vger.kernel.org, x86@kernel.org
Subject: Re: WARNING: kernel stack regs has bad "bp" value
Message-ID: <20241224065146.5ety7gme2tndv4dq@jpoimboe>
References: <CAGXGE_LB3RBqujRWE4fai5hrG6WHk-_c9mToEc0Q_1rBY7M9Xg@mail.gmail.com>
 <20241223141135.g5lkpzhz32pcpzku@jpoimboe>
 <CAGXGE_J6zQip-4jSMghKXSHnE2dASLF1maw9Ev-4EwyfJL99Mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGXGE_J6zQip-4jSMghKXSHnE2dASLF1maw9Ev-4EwyfJL99Mg@mail.gmail.com>

On Tue, Dec 24, 2024 at 11:17:30AM +0800, wzs wrote:
> The output of objdump -r --disassemble=vmw_send_msg vmwgfx.ko is as follows.
> Since the content is quite long ,i need to split two parts for saving.
> Similarly, I have also saved it in the attachment.
> console output 1 : https://pastebin.com/mBi6fTdM
> cousole output 2 : https://pastebin.com/89SMLgCy

Thanks, this seems to be caused by vmware_hypercall_hb_out()'s misuse of
the %rbp register.  Unfortunately there doesn't seem to be a fix for
that, as it looks like a hypervisor implementation detail.

The good news is it's probably nothing to worry about.  Regardless,
frame pointers aren't very useful anymore and I would recommend you
enable the CONFIG_UNWINDER_ORC option.

-- 
Josh

