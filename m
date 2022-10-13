Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F5D33C5
	for <loongarch@lists.linux.dev>; Thu, 13 Oct 2022 15:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E7DC433C1
	for <loongarch@lists.linux.dev>; Thu, 13 Oct 2022 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665674858;
	bh=myeHeaWInMdCAm60tY6McH+eKfDRYbTXRzlUHuFH74Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NwvNpc5DoZ9Q/vC851T9KWaWr01cC1qCEY2hDUK+S4iE0CI2ohNq7DhrmaJcxs3wa
	 tygy+ZdpNwCKcAzEbeTDQzieegX4wKGvrp27bxd2rwUNRZ4t5oHz+OXoNMzUBBVr0+
	 ao81gFaolxvfcKypSeFiOAk4UhnFKR9S1YTClxX4W5aZWYYn5Lzt0amMStpsw646t7
	 1/tpuWcawMlOlxRmufnVs3USljjAH9kkxPDuipbKzWwFS33MY9KvuCFwA5/9AXFpGw
	 mdWpjFNC+xcgXHHLSsSXZaP/l/ivicn5tNTMID7U/pQa459qWsiC4LtfZZVMslwsUf
	 xwLF6/i011nvg==
Received: by mail-ed1-f49.google.com with SMTP id s30so3160532eds.1
        for <loongarch@lists.linux.dev>; Thu, 13 Oct 2022 08:27:38 -0700 (PDT)
X-Gm-Message-State: ACrzQf0IhzDWit5q7ZnvvPrYYzADRQBjEu1J640DsprJQ5wUuR0SA6LY
	Tp2l/cuN2EY3Vr3ifgXjo1xfOWjX8jc9o4ShiME=
X-Google-Smtp-Source: AMsMyM61ntkQ09tAxmD/aksdqFbedBD1EgpOXV90Jy2r2V93n3AtnJgua0sIPdZJp2Qzl14ulQmFptdaSMyb1iDxp6w=
X-Received: by 2002:a05:6402:550e:b0:456:f79f:2bed with SMTP id
 fi14-20020a056402550e00b00456f79f2bedmr316976edb.106.1665674856608; Thu, 13
 Oct 2022 08:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221012144846.2963749-1-chenhuacai@loongson.cn> <CAHk-=wj=62F=soverz1NT41B1_CMtaxnUZX+_qGQ3mbeQdjivg@mail.gmail.com>
In-Reply-To: <CAHk-=wj=62F=soverz1NT41B1_CMtaxnUZX+_qGQ3mbeQdjivg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 13 Oct 2022 23:27:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H49Te6h4Qx0xaKwk8y29pgW+12=hpsJh8w6Tkyp84f0UQ@mail.gmail.com>
Message-ID: <CAAhV-H49Te6h4Qx0xaKwk8y29pgW+12=hpsJh8w6Tkyp84f0UQ@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch changes for v6.1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"

Hi, Linus,

On Thu, Oct 13, 2022 at 2:24 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Oct 12, 2022 at 7:51 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-6.1
>
> Grr.
>
> This was rebased mere hours before the pull request.
>
> Much (all?) of it has been in next - with different commit IDs, of
> course, but the question remains why you have rebased it?
I'm very sorry for that. The patches are in linux-next for some days,
but the kernel test robot reports that there is a "define but not
used" warning, so I fixed that warning and rebased.

> It just makes it much less convenient for me to check "was this in
> next?" and is generally a *horrible* thing to do.
I will avoid such operations in future, sorry for that again.

Huacai

>
>                        Linus
