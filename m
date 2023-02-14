Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D9315B7
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 12:47:18 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id h4so9099477pll.9
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 04:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=//PUD5f7GplM89519c0hmn3dKQI620mHmk1UnlP9FPs=;
        b=XNPocGj7eiVthaKGOlegbMgkhofmsHsGcNdlNwjpQdYwAny3M5QEpXJe0VmLiF6xxr
         /rXwTQZkegRR11PvKJL3YEULFvw+FtKn3U4QtH9lGtG50xveeknTG2ZbxXqm3p4icUWo
         Tb3ApuzTX+rBRTCJTUIlAuPNNjlLQhkwLwiExWPwX4E9QX0822kRSzwimJPPUCS+oUrK
         hHgE7W0ChecHAsJYcyX/wAY4y+F5w8me7BbUw8tIDJqjj83BeWfp48J5HOLzoUL2RRjI
         WkgLqIqDw7b2/ZDO9q+xBrbmrUY7gZZ90kwKcRSdbgbIUYy2olrnv8r7g1Tg0mVTRlqB
         JBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//PUD5f7GplM89519c0hmn3dKQI620mHmk1UnlP9FPs=;
        b=hJXCoAWZH8zGugOVxV1AoLmsfjsRFIuP0jxp+ZeVefNSlwd/6W/R5asBsALOjHX5C3
         AC3ipaCo8wvYX34vEya+1YSW9qt4RGr0lHSzpdPMiESeScNMq0vEnr4SOBaa4qs0PCBu
         IpKCqx2lspZw74aamYGo9jFmCMEYkPrH5wc5DYr4SYJgGhAhNk7eGaW7SsuTJBtrrMGv
         biBs0IujbprKtJCjljaqb2HbAS85U4bNS+VJtsLxGXJc+XlkF/Jp+qKfa/w7daeSfq9P
         Yw+s6XKdCKzUwFo+GQGgghuYwiLuM4zDSQ+hN+hOYhm0bJ1x/W1CQlPA1sjOjGOoqUPQ
         TNtA==
X-Gm-Message-State: AO0yUKWlJOlffw3Rqmo56oMJPqFl6bvwNQradxAerCXMWyquCry5l9jZ
	+bL4+/WYzrC3QmSOQk2zKocaf/W6dBkJl8o1Bn4=
X-Google-Smtp-Source: AK7set+2pnH1CKd+RN83wqleMusbpFy3FlkYCo/TdXhpVa1RoyC5/XuwIYKjr9SCKABLrHl8FZUY+III+SgNUgOF72M=
X-Received: by 2002:a17:90a:ac18:b0:233:c5e8:7213 with SMTP id
 o24-20020a17090aac1800b00233c5e87213mr2422754pjq.93.1676378838445; Tue, 14
 Feb 2023 04:47:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1676358308.git.jpoimboe@kernel.org> <ad801544cab7c26a0f3bbf7cfefb67303f4cd866.1676358308.git.jpoimboe@kernel.org>
In-Reply-To: <ad801544cab7c26a0f3bbf7cfefb67303f4cd866.1676358308.git.jpoimboe@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Feb 2023 04:47:06 -0800
Message-ID: <CAMo8BfJsxu0Q1a0KOq2giBCESZE-Y10nqTOT43XQje0FtM7ixQ@mail.gmail.com>
Subject: Re: [PATCH v2 20/24] xtensa/cpu: Mark cpu_die() __noreturn
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, jgross@suse.com, 
	richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
	linux-alpha@vger.kernel.org, linux@armlinux.org.uk, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, 
	linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	loongarch@lists.linux.dev, f.fainelli@gmail.com, 
	bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, 
	linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, 
	ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, 
	davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, chris@zankel.net, linux-xtensa@linux-xtensa.org, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 13, 2023 at 11:07 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> cpu_die() doesn't return.  Annotate it as such.  By extension this also
> makes arch_cpu_idle_dead() noreturn.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/xtensa/include/asm/smp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
