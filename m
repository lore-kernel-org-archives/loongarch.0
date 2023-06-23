Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA88100CA
	for <loongarch@lists.linux.dev>; Fri, 23 Jun 2023 18:01:29 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-bd5f59fb71dso894401276.3
        for <loongarch@lists.linux.dev>; Fri, 23 Jun 2023 11:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687543289; x=1690135289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrJkokJikgOCvzs7OI6rvSjtU00f06IG7Q3tiUY6Zfw=;
        b=fKUSyljafe4wuS9v3vyIjFynsz5MACLBz0a5H9UlIA8jXUvi2Sr5rUqI+VsR4RcfOP
         rrnKf+hlHMqAV+kDel/pzWQL5N8Biprf0ZYNnVXC4+IDMILuZP6EiocJ2m8a6q1I4n8x
         ntws0C+3BIw6B5Vb7Tswsa9xjex/3/VAGGt6MMKQUOdth10ifuvdfUPdD0pv7f8dxwv6
         OChofOgSE4F24S2+il63jZ7/e279hd0+3vkWrYE0J5LJbI4vb47Gh3iBuiDvEw1KBen1
         6MNx8md/E17VWxSysu3Li44uGwMt4rJ9LMLk6bUUWTBjz2b/Si1Mw1wMNjgwrJfhA+LJ
         CvfA==
X-Gm-Message-State: AC+VfDxSXPAWLhFWQeKJXYUhf4BFBas7nPEIJS2zzM3TfOoMwlML8Zqj
	DQFJM/4QKwWmPtWsCHzmpYNlRE2rk7ApXjb7h/E=
X-Google-Smtp-Source: ACHHUZ7gcMe3ibKA/hNp9Z4n8zg1/7efJ7VqDxtomIKEicWZSRCUJthxrmNt1VrTXT93ysYlhgzVdaLiU1DTdSiYx08=
X-Received: by 2002:a25:18d7:0:b0:bcd:f5f3:2e11 with SMTP id
 206-20020a2518d7000000b00bcdf5f32e11mr20184302yby.11.1687543288690; Fri, 23
 Jun 2023 11:01:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1684835873-15956-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H4Es7qs54zr_hNPwn5MfgeLiKr3sgoTUP5iNj3JrH-1Uw@mail.gmail.com>
 <7a085947-9011-ebc9-a97d-7a62c755a978@loongson.cn> <1c3c95c7-54e9-a65a-2f63-3a16af0fc2bf@loongson.cn>
 <CAM9d7cj8mk_jAmK5KYrAJW248Nc1UY=_yD5BRBM+8aC+BaRBTw@mail.gmail.com>
In-Reply-To: <CAM9d7cj8mk_jAmK5KYrAJW248Nc1UY=_yD5BRBM+8aC+BaRBTw@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 23 Jun 2023 11:01:17 -0700
Message-ID: <CAM9d7cgZqyv6gPs=6LRNEgT_-PkRPz+TVRSSi-trSD9vb=59-A@mail.gmail.com>
Subject: Re: [PATCH v2] perf symbol: Add LoongArch case in get_plt_sizes()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Leo Yan <leo.yan@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 3:33=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hello,
>
> On Tue, Jun 20, 2023 at 9:36=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> >
> >
> > On 06/08/2023 03:01 PM, Tiezhu Yang wrote:
> > > Hi Arnaldo,
> > >
> > > On 05/23/2023 06:26 PM, Huacai Chen wrote:
> > >> Acked-by: Huacai Chen <chenhuacai@loongson.cn>
> > >>
> > >> On Tue, May 23, 2023 at 5:57=E2=80=AFPM Tiezhu Yang <yangtiezhu@loon=
gson.cn>
> > >> wrote:
> > >>>
> > >>> We can see the following definitions in bfd/elfnn-loongarch.c:
> >
> > ...
> >
> > >
> > > Are you OK with this change?
> > > Could you please pick it up in your tree?
> >
> > Ping. What is the status of this patch? Any more comments?
> > Is there a chance to merge it for this coming merge window?
>
> Sorry for the late reply,  I'll apply it to the perf-tools-next tree.

Applied to perf-tools-next, thanks!
