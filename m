Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17BE808
	for <loongarch@lists.linux.dev>; Mon, 27 Feb 2023 09:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677491955; x=1709027955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jR91B98qom+5gzYhQGkhIgN06B7vIdWxDnI3INGZGCs=;
  b=WF6UhWcbFp2kL/1V64Rb28KCRs+oJYzcK0djftIcjNihXFPNiV8lDhQg
   HkNOv2+u/sb3ZxEB6iVlmuGnAv8Uiq8Z9PKzdse6XmvzjzCKZaKW8qSk3
   CYgCpQ3Hbj7hZb2jZ2sY/sPE0vtnp+gwbmEEgoAGUS26Vra23DHn057CN
   HCCAishFZs4odYeECe6z9njObmULQCrlV7u4zok3izcjJYpUqoretOTcn
   x/GLyQI5n0yDJ5KxX1vTiE2lSVBQ1iICwopTEFLl9/gyCPyBEKj1CLvua
   L5GweQ88vBphOLwVPVzF/UlBuq+FF2D4da/s3X3I2QxkNUn02dYulPIwK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="335304388"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="335304388"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:59:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="737604557"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="737604557"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com) ([10.249.41.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:59:08 -0800
Date: Mon, 27 Feb 2023 10:59:04 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] io_uring: use __xchg if possible
Message-ID: <Y/x+6KutaJKGv+Zz@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
 <20230118154450.73842-5-andrzej.hajda@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-5-andrzej.hajda@intel.com>

Hi Andrzej,

On Wed, Jan 18, 2023 at 04:44:48PM +0100, Andrzej Hajda wrote:
> Recently introduced helper simplifies the code.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
