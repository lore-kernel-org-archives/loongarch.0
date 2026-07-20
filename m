Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1135343B6D9
	for <loongarch@lists.linux.dev>; Mon, 20 Jul 2026 22:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584879; cv=pass; b=PsNsgf1foOBRlofbcDiz5tb7GIOTN7QoiumtWliatxx+4i67Hb6sSfg8pl6RtxQGVb99Qq03H4dZOVc+ZDhlG9P9j3LbOkCw7aL7+87rCuOWjlyDpOxxgWkLdtjB03vYFcmxT2KCP7cLqLY9IU6x1DIbRGi1Yo5miesQGEVNE8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584879; c=relaxed/simple;
	bh=j/7Pu0goIzrDPISYd7UGXNeACZWMCvQbsT7AmxUh2RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7fkT10uo8fQfVOzj+v4+GU4sdVC1rhfoFUs56ELFFldLuQ3LEGw4xwrtqdXITmSZbHzbkCr/VBufMVNXSfQlecAsCtgz4IVxjqg/b2HVOLmjP4ItjxvtO5PitEjHZ7XMgDtrbTV09mBQDmhpvjPSGjqDhHDs72k1tWu1zZMnXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQWSP9e/; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQWSP9e/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so11991042a12.3
        for <loongarch@lists.linux.dev>; Mon, 20 Jul 2026 15:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784584875; cv=none;
        d=google.com; s=arc-20260327;
        b=J6Ad96MxFVij/AbD2MYsGe+WX+0rAp4PzVbeW0iALFcQEU8s3rrEnMnOA0bkLZxHAP
         m8vzj05Xm9z2aZuRRihXEhL02mDarwEpRdNjCom2dbvAspMhXPUxauuNy4ieyE/NZpp8
         ycuduWnXr9wykH5085zpIeCibir4jj+CshsIabWgy5xBnGkyIxmR6H6oFd6uCclhwRx3
         r8HNEh2L+TLWUeoPl5WObUwkasM8uEA78s8Rjr6X466grgQ5FW9y7vXeyncygqmjqvl9
         2h9l+MehIQognbVlEf0oqp+jLMPfWx0rOL4DdMJBdNFGYjz8PmrBPUoY+RwCrTNaX96m
         mQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        fh=z5EDYaYigNi4auyEXgKN3PA+x9/9Y1XNjJRtmEbStoU=;
        b=bmHNVc0H1g0kqpBqIaccVDdQyS7y+sYiExJ6tDZiGjsTlTyO0QCgNU9SXmMrbOb+4g
         m3djPZji1Ov9kCIG+jdDUmJGzhsy2efNq4ItN745qDO+LAi7Akxcgh9SxQuxJHDKIw+f
         eihS016qa/vMXC0uE0hcDG+gXuryFV34JyiT1S07Rfw+Vk24eDhpirt92Y3Un7y5vP2S
         QHmOXawRO7E+0YreRhNsu854a+x7VhFHjIwA+U1tSkX0hVKGiEfib3bXHpuVG60jlwIG
         nJbTaYTwNrg8IeyrRB0hWV9MKVP5m/40+tY8LTyiNcEXeOYa6KcpZFa1MlIXOIWQRqmt
         04vw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784584875; x=1785189675; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        b=oQWSP9e/3cXjpImFYCN3t/kmfqYLXc49wMOdbHDZxtHB0Yw07AkAF/02v+4rm+/Bfe
         5EbXOK5W43e5ZnJU2QsoEQpFksvzjdDms6E1oneXKJS5eH7lnBbqNKWpzFlPlyXuCQEh
         l+/sftj0dryX3qY5svEI3CWXKoreaTiWMA6A/1lbqOuioZuUA4rv56HR18DZN2eQan/4
         fuG1s1QGhE3mIwVLvacG/j3KhENby77L7FSJjR+OCNEZgCzg0cLWwZlfJSqB64JzJ/LZ
         yLC2du0HhD0WyviDi1W3A8L34GHGeVynibBMM+hTZPd4d0euHaJE1jB3GICQhR8DbuM2
         DR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584875; x=1785189675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        b=Dkcrj3B9HRxjOwILRPHTI290A/7zD50PPScsSk6cCcMEY7Yy27HuFKWQNq+S9X+LOG
         BQC+lzHz8BPBODLvRKtmKvXXqVEcLds9XIf6cctLlmWb0oCKG09+cTpew6gMla0lh1ft
         IYKmdCrazC7GNU+16zaAYB2b8HNXVyUCRmLt5mTkqufKf2+x8Q6ES4+c4e2SEseMCKuD
         /6name1KFEImM/n77gz/MrVe3741AhaOXDYo9CAMZejClL4p2jEna6ogKTmXFzLdV2/0
         1mjQgEG6ddE0JAiWs+ebgADJ4lW4LxL92gVtsAYPDHzh/9lKC4A2s0NaaNq6MCZvbWeg
         wzqQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCNhKt2QVF/d3tavrIOAbNnk72sBACH7wwEXC9dmpiiGmZglYmnIHp6ylkysRFBjEet/AvnIdeWsA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwljphjKJnaD36c4kKXDChw2J7R6N8/2tFRO2kvHi5xbLYevrPi
	QSA4TOMBfTWJLce2OhbptaPnPciWu4EOyqlYRgwxDtu53TMDztoyannDCGiMKlEX6+dvjCDN0QJ
	rnmD9xRCVg8Sj02riJ2DOh4JvE7bxI9Q=
X-Gm-Gg: AR+sD10sEKt3JFplU5gxbyc5VwHerCbAWNEu5pgQ0J80ki1Q/7AdlQ4ZDvFRN4E+BTC
	wsTxxvTtLcfnhM76lJFjR4lz+zYzChaoUlG1tRgSmEWym1dr/aQzTL1k9V6BHDSiw35TAgKfbHy
	gN4Ih+rYnJGnm8mMkOgcHcNZjYhYI1KvM6W8kxfRcfWPKfYMdSbd5Rli/Gr70cDApJ/sjDCXMPc
	GRC768/+m0umm9WzbJBWpJ5UAhdK3OihFW5ie//wJByPLGv6KrNo2zZvJEPWg2KpKtERrw7O5lN
	D4+MtSy1KEst/Bc2vV92DogeXJG+J1I=
X-Received: by 2002:a05:6402:2356:b0:674:5b2c:d42c with SMTP id
 4fb4d7f45d1cf-69e6525c770mr6536246a12.3.1784584875096; Mon, 20 Jul 2026
 15:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <CA+=Fv5TDNH8+JAojV9_W36kUkEE68uiA00FQ7i0vJunebqs1sA@mail.gmail.com>
 <87wluplb6k.ffs@fw13>
In-Reply-To: <87wluplb6k.ffs@fw13>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 21 Jul 2026 00:01:03 +0200
X-Gm-Features: AUfX_mw5696pn_wiz_LjCaJHiFU9IchwhNNUbBWmuIdhtqSFIK3TJnj9-atYCBw
Message-ID: <CA+=Fv5Sd5+-K3-MOiEc2N8z_5CoLQPVPUwjiugSj3u8cBWJXXQ@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thomas,

On Mon, Jul 20, 2026 at 9:21=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
>
> Similar to what Peter and me suggested in the related discussion
> vs. s390 which has a similar issue, you can just have a dedicated
> syscall_return member in your pt_regs struct, which is preset to -ENOSYS
> and operate on that. You have an unused padding entry there which means
> it won't even change the size.
>

Thanks, that makes sense in principle.

One complication is that my Alpha GENERIC_ENTRY branch already reuses that
former pt_regs padding slot, while keeping the pt_regs size and stack
alignment unchanged. The extra syscall-entry bookkeeping I needed so far li=
ves
in thread_info rather than adding more fields to pt_regs.

So the padding slot is not free in my current branch. I can still look at
whether a dedicated syscall_return scratch value would be cleaner, but the
tested version currently handles this by setting the default -ENOSYS result
only on the no-dispatch path, after generic entry processing, and only if
ptrace/seccomp/BPF did not already provide a return value.

>
> You were on CC for the V2, no?
>

Sorry, I must have missed that.

> The whole pile including Jinjie's seccomp bypass fix is in
>
>     git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
>
> and is targeted for the 7.3 merge window.
>

Great!

> If you want to base your stuff on that for 7.3, I can add a tag which
> makes it immutable so it can be pulled into the alpha tree.
>

Yes, please. There is still some ongoing testing/review of my Alpha
GENERIC_ENTRY series, but assuming it is ready in time for the 7.3 merge
window, an immutable tag would be very helpful.

Magnus
