Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013647F
	for <loongarch@lists.linux.dev>; Tue,  2 Aug 2022 07:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB271C433B5
	for <loongarch@lists.linux.dev>; Tue,  2 Aug 2022 07:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659424198;
	bh=0jhHYyhCK+3Qhtr9ig01rDqez0BJmbBa8YmmaJMFHwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e9djQ/IGu8D5BlBmzQCVPktfYtADj9VUlvUc4wHOUshL2ItJTmLGk5XxGmp7LTamK
	 7sQPbPmnl3hD0qR7Yejsjk4DIZCAU6TKTWpf4MKZw7WSqk3DfPQaXo+jQDohTCjNPV
	 wd36oWM8YDqnp9+tgHfBSih4lpv9TKMQXnVjokkHjcLAeL5587NlqlbTwbqnfFT2T1
	 OEdU+zlJejCKZI9AkOTchr4956mPzmMfaluKddsvngFBiS3sEpMtROBhXPudl9mc6V
	 kRj7uZqBVHKB4clcoeybVZE7KqTzzEy7paU+lhmuGQbC08+MteqiGgDo+dKyQtwFSM
	 hsYMDV0RDnyeg==
Received: by mail-ua1-f52.google.com with SMTP id b4so4149782uaw.11
        for <loongarch@lists.linux.dev>; Tue, 02 Aug 2022 00:09:58 -0700 (PDT)
X-Gm-Message-State: ACgBeo00W96+4jvAtWfMJLPn9iniZ+/hmfs35dtcOnbZVIC5gIYLR8xd
	GdkAne2wFP5WOmwnch7VX6E+HcYek2hd3DUj8BE=
X-Google-Smtp-Source: AA6agR6grG2wQ5RJQ1Vef384HnoTVHvPAk/6u5j5UAg5aRz5bLpJE+22XfZgTZMFTDku5HsFuN1bkDeWgrYDh5cNfKk=
X-Received: by 2002:ab0:2359:0:b0:387:2dff:87d5 with SMTP id
 h25-20020ab02359000000b003872dff87d5mr7720498uao.104.1659424197668; Tue, 02
 Aug 2022 00:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220802053818.18051-1-zhangqing@loongson.cn> <20220802053818.18051-4-zhangqing@loongson.cn>
 <CAAhV-H4qWTbjb45VNbA0is_2w1sgSW54kSngVhVpac5VehwoEg@mail.gmail.com> <e3df8c34-806c-e4ea-2fcb-df8efd0af610@loongson.cn>
In-Reply-To: <e3df8c34-806c-e4ea-2fcb-df8efd0af610@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 2 Aug 2022 15:09:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H59tqWEFMPJ5=01qtYjd3P7xbA=Exgz2pU1nfq4ejiKGg@mail.gmail.com>
Message-ID: <CAAhV-H59tqWEFMPJ5=01qtYjd3P7xbA=Exgz2pU1nfq4ejiKGg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] LoongArch: Add stacktrace support
To: Qing Zhang <zhangqing@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Jinyang He <hejinyang@loongson.cn>, Youling Tang <tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qing,

On Tue, Aug 2, 2022 at 2:39 PM Qing Zhang <zhangqing@loongson.cn> wrote:
>
>
>
> On 2022/8/2 =E4=B8=8B=E5=8D=882:03, Huacai Chen wrote:
> > Hi, Qing,
> >
> > Though we had an offline discussion, I still think adding get_wchan()
> > support is worthy. :)
> >
> ok, I will adding get_wchan() support in v4 and modify the abbreviation
> of commit messages. :)
Maybe you can wait for some time to see if others have more comments.

Huacai
>
> Thanks,
> -Qing
> > Huacai
>
