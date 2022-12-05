Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA517D1
	for <loongarch@lists.linux.dev>; Mon,  5 Dec 2022 06:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96801C433B5
	for <loongarch@lists.linux.dev>; Mon,  5 Dec 2022 06:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670220384;
	bh=pjso/qsrozrRB50GYd7pdmVFJyDd6JU+QXbecamEEkI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h7ty0eCvQ3l+eNYDg/vlVfXc39Prl3lMkZZOHFO+T4A5PKBCbGcn2dH6/P8JNCrcZ
	 cz5KkXFH1s3syLzLiStJh77QP7xt9VIYHwaBsEX+Homr54FMrIMnNFKcrMhDnKZ9XR
	 YZ2DcN28y0VEZnnbEvf+g6ySXk7ugUKAMp12Xo+xiUrczjmCdt/oB5Y8pmup2sySxl
	 RCmUBoGEpIYXOCYecWAWNUtRRqbmyCJxV1eHwc0YAvqEV/Nsa7p76BA3pYKcwoH1E5
	 zZTlO8t+zN4DQS7C7SXzXB+DY+9cjsN1hA8nYpuJhpec8dJZKQ7UbGZvG2oxgQJvTB
	 nEnjmqQLdhPhQ==
Received: by mail-ej1-f47.google.com with SMTP id o13so25253828ejm.1
        for <loongarch@lists.linux.dev>; Sun, 04 Dec 2022 22:06:24 -0800 (PST)
X-Gm-Message-State: ANoB5pm1cvAd/PJOxKn0J/B8u2xNl2Rdw/rPtJ/R7LNYvbxEEh6UQUlO
	x47bNDwgQVIUPYLBJ6y1qbkgVT837nf+H0vE3ns=
X-Google-Smtp-Source: AA0mqf5mKbFfNKkeLjUGLcFEEUq1cb0+SCdUWFyaPNlg3RvesEe24Bk4h/NzxhpsIgCaLemEIpyB/dnQ4ClNJCkOrS8=
X-Received: by 2002:a17:907:37a:b0:7c0:e4b6:132e with SMTP id
 rs26-20020a170907037a00b007c0e4b6132emr5051002ejb.224.1670220382722; Sun, 04
 Dec 2022 22:06:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221204141027.2511383-1-hengqi.chen@gmail.com>
In-Reply-To: <20221204141027.2511383-1-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 5 Dec 2022 14:06:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7F5R6gVR4KufBitusg5A++z-1cJjnMdNLCYg2EyzafLw@mail.gmail.com>
Message-ID: <CAAhV-H7F5R6gVR4KufBitusg5A++z-1cJjnMdNLCYg2EyzafLw@mail.gmail.com>
Subject: Re: Question about 'ipmi_si IP I0001:00: There appears to be no BMC
 at this location'
To: Hengqi Chen <hengqi.chen@gmail.com>, Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 4, 2022 at 10:10 PM Hengqi Chen <hengqi.chen@gmail.com> wrote:
>
> Hi,
>
> I built the kernel using loongarch-next branch, had the following errors while booting the newly-built kernel:
>
>     ACPI Error: No response from Global Lock hardware, disabling lock (20220331/evglock-59)
>     ipmi_si IP I0001:00: There appears to be no BMC at this location
>
> How can I fix it ? Thanks.
This is "harmless", but I think Jianmin Lv can provide some detail information.

Huacai
>
> --
> Hengqi
>
