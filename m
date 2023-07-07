Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF311852;
	Fri,  7 Jul 2023 05:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C79FC433C7;
	Fri,  7 Jul 2023 05:59:32 +0000 (UTC)
Date: Fri, 7 Jul 2023 06:59:30 +0100
From: Greg KH <greg@kroah.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, suijingfeng@loongson.cn, arnd@arndb.de,
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Subject: Re: [PATCH v2 4/4] staging/sm750fb: Do not include
 <linux/screen_info.h>
Message-ID: <2023070721-detector-unlatch-cae3@gregkh>
References: <20230706104852.27451-1-tzimmermann@suse.de>
 <20230706104852.27451-5-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706104852.27451-5-tzimmermann@suse.de>

On Thu, Jul 06, 2023 at 12:42:17PM +0200, Thomas Zimmermann wrote:
> The sm750fb driver does not need anything from <linux/screen_info.h>.
> Remove the include statements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> ---
>  drivers/staging/sm750fb/sm750.c        | 1 -
>  drivers/staging/sm750fb/sm750_accel.c  | 1 -
>  drivers/staging/sm750fb/sm750_cursor.c | 1 -
>  drivers/staging/sm750fb/sm750_hw.c     | 1 -
>  4 files changed, 4 deletions(-)
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
