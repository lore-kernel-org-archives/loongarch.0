Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CF5EA6
	for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 08:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14276C341CD
	for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 08:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656579219;
	bh=98LP8TqrAriutG23cVTk9h4C/uw9Lw8fbs5WwhfVi40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pCfiIOuRlS6deNhUfZbpGjWGIVTgcU0TRbrE7TwiGCQmgN9h+Y0+o3y8lEfj18X77
	 RNUhjvbez2W1w6C/exIBHvBpRc/fIV79Subv49LmORt2pGCJvv7MuOt2sxyHeB4taG
	 4uydP7XdjpETqE5JlfQQzv2k8snm0uZT5+DRQfQUAFTGZMSmFocpnnHQM1H0fOZECM
	 V/v05y+Ym3VHBNrG1DAIqZMGh4L8Ky/jyN0i4jTqNy5yHwgs6LdlT73i261gE+fdt1
	 c7aIO8r3XE+6GTt4LQL6RU+YQ6kRuxk4KyCQCtq7Hquecwd2ESdkKwDWhFzBGzXRPx
	 L3ujRJ7vRnVeQ==
Received: by mail-vs1-f43.google.com with SMTP id o13so17597517vsn.4
        for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 01:53:38 -0700 (PDT)
X-Gm-Message-State: AJIora9AKmoN0KCn8eaRn3msm8dPHgvsI6MyYBd1OZ/Tw5ZmtjuV5c9/
	10gXUte7IdJCAigIKm66+xQW/GbUKCtYHE1DLWg=
X-Google-Smtp-Source: AGRyM1usGSpW65/S+D3bTGvnsIsuanAbAX0oa4OCyYXk/MFf5yU3THi8COlykfUvDOw9YX5tbgBR13xexsBTWE/4zc0=
X-Received: by 2002:a05:6102:6c4:b0:354:3f88:4d3f with SMTP id
 m4-20020a05610206c400b003543f884d3fmr8085454vsg.78.1656579217987; Thu, 30 Jun
 2022 01:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220630043237.2059576-1-chenhuacai@loongson.cn> <35094088-d5da-cd36-66e2-5117304c5712@gmail.com>
In-Reply-To: <35094088-d5da-cd36-66e2-5117304c5712@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 30 Jun 2022 16:53:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6NubNmoNvOkjnDT925O7Kb0yKPDKhGXroxhrU+AuECfQ@mail.gmail.com>
Message-ID: <CAAhV-H6NubNmoNvOkjnDT925O7Kb0yKPDKhGXroxhrU+AuECfQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/4] mm/sparse-vmemmap: Generalise helpers and enable for
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux-MM <linux-mm@kvack.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Feiyang Chen <chenfeiyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Sergei,

On Thu, Jun 30, 2022 at 4:30 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
>
> Hello!
>
>    Your subject looks unfinished...
Thank you, this seems because the subject is too long.

Huacai
>
> MBR, Sergey
