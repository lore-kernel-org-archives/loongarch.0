Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DD07F
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 03:54:24 +0000 (UTC)
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3183s7LV029345;
	Wed, 8 Feb 2023 04:54:07 +0100
Date: Wed, 8 Feb 2023 04:54:07 +0100
From: Willy Tarreau <w@1wt.eu>
To: chris.chenfeiyang@gmail.com
Cc: paulmck@kernel.org, Feiyang Chen <chenfeiyang@loongson.cn>,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com, arnd@arndb.de,
        loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] selftests/nolibc: Add support for LoongArch
Message-ID: <Y+Mc37ACt0PUBRAQ@1wt.eu>
References: <cover.1675734681.git.chenfeiyang@loongson.cn>
 <2d77fe4e895847ae1ea09088dcfa411ce2f57f5f.1675734681.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d77fe4e895847ae1ea09088dcfa411ce2f57f5f.1675734681.git.chenfeiyang@loongson.cn>

On Tue, Feb 07, 2023 at 10:09:42AM +0800, chris.chenfeiyang@gmail.com wrote:
> From: Feiyang Chen <chenfeiyang@loongson.cn>
> 
> Add support for LoongArch (64 bit) to nolibc selftest.

Please also mention in this one that the makefile was reindented with
no other change than adding entries for loongarch, this will save
those reading this patch later from checking that the rest was not
changed.

Thanks!
Willy
