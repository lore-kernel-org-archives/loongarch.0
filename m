Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848C78835
	for <loongarch@lists.linux.dev>; Wed,  1 Mar 2023 19:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1677699491; bh=GcfWBxqCX24zQPXlEQthuMrL0icJqe33N9l+SGoeTz0=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=YL5ArQmAiK1YBeW8tIUtLd56MNu/rFsww1pkf6wlo13XjNCgdCMfVzB7Wx0xC0fFS
	 /3QS+ChEQk7fLrvyN/B66xxSlSW3tOLA+tmnMiX/sUykU1fpCuhRfEfU1u1Y8eIa8h
	 XbVccnVJlJti4eHM34xT3tDjHeBwAuXDiBU9ccUQ=
Received: by b221-2.in.mailobj.net [192.168.90.22] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Wed,  1 Mar 2023 20:38:11 +0100 (CET)
X-EA-Auth: /7NY/Fkev3jYi4TjVHxHUvuxICPz2Zu0MZJ7cWUyK831vetoDfymBqjJBl2kCMDemmELn3surH7LzQWeLKMJ/ISCM8j3HVRa
Date: Thu, 2 Mar 2023 01:08:07 +0530
From: Deepak R Varma <drv@mailo.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Yinbo Zhu <zhuyinbo@loongson.cn>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	Saurabh Singh Sengar <ssengar@microsoft.com>,
	Praveen Kumar <kumarpraveen@linux.microsoft.com>, soc@kernel.org
Subject: Re: [PATCH] soc: loongson: use resource_size() helper function
Message-ID: <Y/+pn2fLBmZhWDga@ubun2204.myguest.virtualbox.org>
References: <Y6TM4ZidDExh8SPx@qemulion>
 <Y7nRpEQSYRkZk3kw@ubun2204.myguest.virtualbox.org>
 <CAAhV-H6cYv=PC76Rsimncoy2udZ4erTzRyy6cMK7zcmeJqO1Ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H6cYv=PC76Rsimncoy2udZ4erTzRyy6cMK7zcmeJqO1Ng@mail.gmail.com>

On Sun, Jan 08, 2023 at 08:57:48PM +0800, Huacai Chen wrote:
> On Sun, Jan 8, 2023 at 4:10 AM Deepak R Varma <drv@mailo.com> wrote:
> >
> > On Fri, Dec 23, 2022 at 03:02:17AM +0530, Deepak R Varma wrote:
> > > Use the resource_size() function instead of a open coded computation
> > > resource size. It makes the code more readable.
> > >
> > > Issue identified using resource_size.cocci coccinelle semantic patch.
> > >
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> >
> > Hello,
> > Requesting a review and feedback on this patch proposal?
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> But I think this should be merged through soc@kernel.org maintained by Arnd.

Thank you Huacai. Appreciate your time.

Hello Arnd,
Can you please tell me if I need to do anything further to have this merged as
suggested by Huacai?

Thanks,
./drv

> 
> Huacai
> >
> > Thank you,
> > ./drv
> >
> >
> >


