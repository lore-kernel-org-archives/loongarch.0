Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F537417F
	for <loongarch@lists.linux.dev>; Fri, 20 Mar 2026 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996081; cv=none; b=c8iA7a2NGoWzhALiUjIrw6AzWCjjb/2m3EA+PyDTYtgQrYRXNrKJN2XDPSuC0vI64M2m/MCev78/K3GeqiVzNToUXxIBl13++KXxcjrTt5HKY3HbdPSIk5/jOfG4Sj5Y/X4a7XV3dZVQUwE9Wp6XrwbruSNA/AWtbk4xqLvxZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996081; c=relaxed/simple;
	bh=9MRwqxQs8a6lUJyQDIiADbmWBX9vmE7jZDF638G+2MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1Ha+jdw5R2IG6KA5fCWR3ldIaev+I4folJcq2PDaVJrlPjwpAWiO3o0QsY/jbDN80NVps8JMwM930wQQ9Iv9k0sS8pZGutGLjCSeYt8+3U4wwsS3DyvoGSi3ib0TRTbNUmwIu70VV+tpmnf3G1xRBurtriGwoQQ/NMh7jGmQPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgpWYK3f; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgpWYK3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773996079; x=1805532079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9MRwqxQs8a6lUJyQDIiADbmWBX9vmE7jZDF638G+2MM=;
  b=HgpWYK3fBt9vjKzf/wnS+688VsaS4AYw5hL8yNwAu1cMIqwAaWggJwiX
   lwT1f2fTV8b3gSgKIaMqEQTz3uA7+9wY28sCItezNtOhqifXmXhEYQ//6
   PR7bfirPWx6VB1tA88svLHUx/52JSk3obpo2SaBoN5R1AyUZCwVo2hmlX
   teQS9A89riPlGulL9VijeLseIaL/mzWvHLyOtXa3FqC64zRJf0zKbODL8
   shwrz4v32MVX83hH0Oc54dHZKDq8rHupdjtjchNFa4f//5LjCQDER4K3n
   yVOF/m2sDzjqmoYTvye9C+rTbxZT7O9OIq5Efr23HsMlDoLeLRjVIQFmr
   w==;
X-CSE-ConnectionGUID: 3OGlqP6kTEmwBWOcXVZaJg==
X-CSE-MsgGUID: PaM7WsB1T/OTOyWclqlekQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75111323"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75111323"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:41:18 -0700
X-CSE-ConnectionGUID: xazFnr9SSuKp0euTZ0GfWQ==
X-CSE-MsgGUID: fcQ2/9YiRJKd35vr3sQwhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="227699767"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:41:16 -0700
Date: Fri, 20 Mar 2026 10:41:13 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C
 controller
Message-ID: <ab0IKd_acdQaizIW@ashevche-desk.local>
References: <cover.1773991081.git.zhoubinbin@loongson.cn>
 <4236113143cc88b45062c1b8a34a1f840f29a0ac.1773991081.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4236113143cc88b45062c1b8a34a1f840f29a0ac.1773991081.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 20, 2026 at 03:25:47PM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K0300 SoCs.
> 
> It provides multi-master functionality and controls all I2C bus-specific
> timing, protocols, arbitration, and timing. It supports both standard
> and fast modes.

Looks good enough to me,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


