Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF447EA1
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 02:33:53 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-67ef5af0ce8so4728282b3a.2
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 19:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690252433; x=1690857233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SM9MI7YqcumJFAsvdHugETP5mtZWx3U5IfVV0xoWahs=;
        b=KFGJS26r1RSbQG3DAjRcvv9/MyJI22frfVgJtQCmWh5C3EkdP0dAILi+WH3K1tOBP4
         rcUa0tHsQRu0ulHhwoDchI/yPu0oieWdfVyXt6GL6sS/IcW4+aP19VxYnGTLBRlWby3c
         KKLCAlx1CvEIoUODLEuOwXMHyCGsvLZsw/92+pFFBvAIP9jD/vXxMCNvI7mXasNdpwMh
         wFxoFq71YNllmgwmpQTtFGOInzu2lOeTsHqsQD8t7O74EEsT3sYogDt/BUJXQBR93Dr3
         RPBGl+uhIsg0Nk86kPkdBhmiA1MNESsDV5xG2VzENGvm7l2Je0IEnK0XcuuQq5BvbiIA
         yikQ==
X-Gm-Message-State: ABy/qLZDxa0ZNV2moZo0Rxd+zeqKvrtAX4vRdbKxKaJ0RYlLAxwzwYGB
	qv0EYZ3X1jAakVeTx4bfXGg=
X-Google-Smtp-Source: APBJJlFVe0K7GMtaxllYKxPFOGwt19poxqCSbLkh8PZkCc+BmgSRNhWmJG3byudSuItSdTzPyYG1PA==
X-Received: by 2002:a05:6a00:3914:b0:682:616a:f910 with SMTP id fh20-20020a056a00391400b00682616af910mr12230293pfb.20.1690252432864;
        Mon, 24 Jul 2023 19:33:52 -0700 (PDT)
Received: from snowbird ([136.25.84.107])
        by smtp.gmail.com with ESMTPSA id r6-20020a62e406000000b00684b64da08bsm8382076pfh.132.2023.07.24.19.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 19:33:52 -0700 (PDT)
Date: Mon, 24 Jul 2023 19:33:49 -0700
From: Dennis Zhou <dennis@kernel.org>
To: bibo mao <maobibo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH 0/3] LoongArch: mm: Code cleanup with populate pte
Message-ID: <ZL80jRwJ1ROz07a8@snowbird>
References: <20230712031622.1888321-1-maobibo@loongson.cn>
 <8d22477f-d7e4-b151-f72b-cea3f1ef3ef3@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d22477f-d7e4-b151-f72b-cea3f1ef3ef3@loongson.cn>

Hello,

On Tue, Jul 25, 2023 at 08:36:22AM +0800, bibo mao wrote:
> slightly ping.
> 

Sorry, I'm not sure how I missed this. I'll take a look at this
tomorrow.

Thanks,
Dennis

> 在 2023/7/12 11:16, Bibo Mao 写道:
> > There are some confusion between pdg and p4d when populate pte for
> > kernel address space. This patch modifies this issue and adds unified
> > function for pcpu and fixmap populate pte.
> > 
> > Bibo Mao (3):
> >   mm/percpu: Remove some local variables in pcpu_populate_pte
> >   LoongArch: Code cleanup in function pcpu_populate_pte
> >   LoongArch: mm: Add unified function populate_kernel_pte
> > 
> >  arch/loongarch/include/asm/pgalloc.h |  1 +
> >  arch/loongarch/kernel/numa.c         | 35 ++-----------------
> >  arch/loongarch/mm/init.c             | 52 ++++++++++++++++------------
> >  mm/percpu.c                          | 24 +++++--------
> >  4 files changed, 42 insertions(+), 70 deletions(-)
> > 
> 
