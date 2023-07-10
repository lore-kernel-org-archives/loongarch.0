Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4788AC8D0
	for <loongarch@lists.linux.dev>; Mon, 10 Jul 2023 09:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CDDC433C9;
	Mon, 10 Jul 2023 09:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688981608;
	bh=FW512bUwkwbM2sy7ptkYcIAJbw1Ta8o+HZebnXCuO88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=He4q2bK6D80vP+DQ/jaf1J+NOI/0R6OPlkwZ3y5E95rFHLYWZ9awDrai2qkjExRyd
	 gJfQGaMaju4ILkuRuF/q6RFu81lAy9sg6tqbvE9yZBdf6lAezqwscANAkLYKT5wAhL
	 Q0XjEBW70dHodiRkJCViA/Nfa64qOv3R/WopbvRh/85wr3Y4OP2wa+TKq/l6JlFAng
	 yhCReC2ixa98lw64Aph+DrCtVigLbNavv95aXKklejb6LJ1PsRrqiMcwCX/XFnV1LX
	 KXW6+OqOVpDcgqnR4ruXx3AfmoUvYw/2Gqrtx9oy9impncy7iK+AGFa0C4lfwpHtcO
	 Tv32nRhmEXfuw==
Date: Mon, 10 Jul 2023 10:33:23 +0100
From: Will Deacon <will@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, loongson-kernel@lists.loongnix.cn,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v5] PCI: Align pci memory space base address with page
 size
Message-ID: <20230710093323.GB32673@willie-the-truck>
References: <20230619014715.3792883-1-maobibo@loongson.cn>
 <f676d9e0-bb88-283a-5189-f1ae945ee4dd@loongson.cn>
 <bdc6eb71-482d-5dd6-d527-c2f2f68dfb38@loongson.cn>
 <CAAhV-H7_Rjv-ySorjbw0f4OiV4J0-N75fmUNBCmeJbeeydJu4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7_Rjv-ySorjbw0f4OiV4J0-N75fmUNBCmeJbeeydJu4Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Jul 09, 2023 at 05:19:57PM +0800, Huacai Chen wrote:
> On Fri, Jul 7, 2023 at 10:47 AM bibo mao <maobibo@loongson.cn> wrote:
> >
> > Bjourn, Hucai,
> >
> > ping again.
> >
> > The is such issue on only LoongArch system since 16K page size is used.
> >
> > Should we add code in general framework  or in LoongArch specified code
> > in v1?
> Though I still don't know why others have no problems. But it is
> surely a bug on LoongArch. So if Bjorn has no objections, please use
> the old method (just like v1 but you can simply align to page size
> unconditionally).

The initial assertion is that this is a problem for any architecture with
a page-size > 4K, so there's nothing LoongArch-specific about that on paper.

More likely, we've only just come out of the merge window so I suggest a
little patience is probably all that is needed.

Will
