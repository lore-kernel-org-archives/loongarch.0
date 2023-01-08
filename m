Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A81FD0
	for <loongarch@lists.linux.dev>; Sun,  8 Jan 2023 12:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22339C43392
	for <loongarch@lists.linux.dev>; Sun,  8 Jan 2023 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673182697;
	bh=1saOZOAtNpPWPen1Qx/OhwdwInDAgoCd9rJuIKMMSRk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JeGSNseuVcgFjGDGVOC3Ft7a4Ci0/NRahW2UPvxPtxDW+tTVJhqsyIc4unYdtkJX2
	 p7eSie8Quh2JjLe+vEb/UgXdPwKWN4sV0VgbgrodCxaCs5d2IoF+TKmaDeddZsUlpj
	 FeTyPWUAXJFmVlp5zbpejW5gfB4rECp/GMpzQobKyawgZGA13gYXuhuykfIwZ0nhxv
	 x7qVZWfGwxnh1Xp8UdS4WNtf8FwGz4wftOE/U54XZeGfYK3t9O/g5Z/LGtqPVmvrdw
	 BlObKHYcFjr5WZSzzvzHvyBIaS3bT0FgknhcFziKWfOAVkJbscPZpeSU15MozQuomZ
	 /840nAGvwNIuQ==
Received: by mail-ed1-f48.google.com with SMTP id c34so8796528edf.0
        for <loongarch@lists.linux.dev>; Sun, 08 Jan 2023 04:58:17 -0800 (PST)
X-Gm-Message-State: AFqh2koFg8LPNyxKUOQAa+WJBSuMU70vwhTYdTw88f5VFjJI6oWAF4pz
	Zl10oftlW9MrNtubUOYoPUnxiVCjifh1JR2fiS4=
X-Google-Smtp-Source: AMrXdXt//1IDlUCBzPu/wRiLPgl0U42hbqG1rjUXf3kdFkIt/kfkzFiLmFUbQiq2bZf/EnFC+YskaE8BNIf93DKu278=
X-Received: by 2002:a50:8a85:0:b0:46a:f4b0:2d23 with SMTP id
 j5-20020a508a85000000b0046af4b02d23mr4741112edj.78.1673182695378; Sun, 08 Jan
 2023 04:58:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y6TM4ZidDExh8SPx@qemulion> <Y7nRpEQSYRkZk3kw@ubun2204.myguest.virtualbox.org>
In-Reply-To: <Y7nRpEQSYRkZk3kw@ubun2204.myguest.virtualbox.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Jan 2023 20:57:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6cYv=PC76Rsimncoy2udZ4erTzRyy6cMK7zcmeJqO1Ng@mail.gmail.com>
Message-ID: <CAAhV-H6cYv=PC76Rsimncoy2udZ4erTzRyy6cMK7zcmeJqO1Ng@mail.gmail.com>
Subject: Re: [PATCH] soc: loongson: use resource_size() helper function
To: Deepak R Varma <drv@mailo.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Saurabh Singh Sengar <ssengar@microsoft.com>, 
	Praveen Kumar <kumarpraveen@linux.microsoft.com>, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 8, 2023 at 4:10 AM Deepak R Varma <drv@mailo.com> wrote:
>
> On Fri, Dec 23, 2022 at 03:02:17AM +0530, Deepak R Varma wrote:
> > Use the resource_size() function instead of a open coded computation
> > resource size. It makes the code more readable.
> >
> > Issue identified using resource_size.cocci coccinelle semantic patch.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
>
> Hello,
> Requesting a review and feedback on this patch proposal?
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
But I think this should be merged through soc@kernel.org maintained by Arnd.

Huacai
>
> Thank you,
> ./drv
>
>
>
